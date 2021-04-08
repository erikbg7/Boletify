import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/screens/search/components/search_methods.dart';
import 'package:futter_project_tfg/screens/search/components/search_results.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ImagePicker _picker = ImagePicker();
  final int bgImage = Random().nextInt(5);

  bool _loading = false;
  ClassifierOutput _output;

  @override
  void initState() {
    super.initState();
    setLoadingState(true);
    loadModel().then(setLoadingState(false));
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.blue.withOpacity(0.7),
                  BlendMode.dstATop,
                ),
                image: AssetImage("assets/search_background/$bgImage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: _output != null
                ? SearchResults(result: _output)
                : SearchMethods(picker: pickImage),
          );
  }

  pickImage(ImageSource source) async {
    setLoadingState(true);
    final errorMessage = 'Error: cannot pick image from $source';
    await _picker
        .getImage(source: source)
        .then((pickedImage) => File(pickedImage.path))
        .then((imageFile) => classifyImage(imageFile))
        .catchError((error) => handleError('[$errorMessage] $error'));
  }

  classifyImage(File image) async {
    final errorMessage = 'Error: Unable to classify image $image';
    await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    ).then((output) {
      _output = new ClassifierOutput.fromTFLite(output, image);
      setLoadingState(false);
    }).catchError((error) => handleError('[$errorMessage] $error'));
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  setLoadingState(bool state) {
    setState(() {
      _loading = state;
    });
  }

  // TODO: handle error properly (redirect, etc)
  handleError(String errorMessage) {
    print(errorMessage);
    setLoadingState(false);
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
