import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/search/components/search_identify.dart';
import 'package:futter_project_tfg/screens/search/components/search_results.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List _outputs;
  File _image;
  bool _loading = false;
  final ImagePicker _picker = ImagePicker();
  int bgImage = Random().nextInt(5);

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
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
                    Colors.blue.withOpacity(0.7), BlendMode.dstATop),
                image: AssetImage("assets/search_background/$bgImage.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: _outputs != null
                ? SearchResults(
                    image: _image,
                    result: '${_outputs[0]["label"]}',
                    confidence: double.parse('${_outputs[0]["confidence"]}'))
                : SearchIdentify(
                    uploadFromGallery: () => pickImage(ImageSource.gallery),
                    uploadFromCamera: () => pickImage(ImageSource.camera)),
          );
  }

  pickImage(ImageSource source) async {
    setState(() {
      _loading = true;
    });
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
    ).then((output) => setState((){
      _image = image;
      _outputs = output;
      _loading = false;
    })).catchError((error) => handleError('[$errorMessage] $error'));
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  handleError(String errorMessage) {
    print(errorMessage);
    setState(() {
      _loading = false;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
