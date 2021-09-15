import 'dart:io';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

// ----------------- EVENTS ----------------- //
abstract class ClassifierEvent {
  const ClassifierEvent();
}

class InitializeClassifierEvent extends ClassifierEvent {
  const InitializeClassifierEvent();
}

class ClassifyEvent extends ClassifierEvent {
  final ImageSource source;
  const ClassifyEvent(this.source);
}

// ----------------- STATES ----------------- //
abstract class ClassifierState {
  const ClassifierState();
}

class ClassifierStateInitial extends ClassifierState {
  const ClassifierStateInitial();
}

class ClassifierMethodState extends ClassifierState {
  const ClassifierMethodState();
}

class ClassifierResultState extends ClassifierState {
  final ClassifierOutput output;
  const ClassifierResultState(this.output);
}

class ClassifierStateLoading extends ClassifierState {
  const ClassifierStateLoading();
}

class ClassifierStateError extends ClassifierState {
  final String errorMessage;
  const ClassifierStateError(this.errorMessage);
}

// ------------------ BLOC ------------------ //
class ClassifierBloc extends Bloc<ClassifierEvent, ClassifierState> {
  static String modelPath = "assets/model_unquant.tflite";
  static String labelsPath = "assets/labels.txt";
  final ImagePicker _picker = ImagePicker();

  ClassifierBloc() : super(ClassifierStateInitial());

  @override
  Future<void> close() {
    Tflite.close();
    return super.close();
  }

  Future<ClassifierOutput> classifyImage(File image) async {
    List<dynamic>? tfResult = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    return ClassifierOutput.fromTFLite(tfResult!, image);
  }

  @override
  Stream<ClassifierState> mapEventToState(ClassifierEvent event) async* {
    if (event is InitializeClassifierEvent) {
      try {
        await Tflite.loadModel(model: modelPath, labels: labelsPath);
        yield ClassifierMethodState();
      } catch (_) {
        yield ClassifierStateError("Error initializing classifier.");
      }
    }

    if (event is ClassifyEvent) {
      try {
        final XFile? xFile = await _picker.pickImage(source: event.source);
        if (xFile == null) {
          yield ClassifierMethodState();
        } else {
          yield ClassifierStateLoading();
          final ClassifierOutput output = await classifyImage(File(xFile.path));
          await Future.delayed(Duration(milliseconds: 500));
          yield ClassifierResultState(output);
        }
      } catch (error) {
        print('error $error');
        yield ClassifierStateError("Error classifying image.");
      }
    }
  }
}
