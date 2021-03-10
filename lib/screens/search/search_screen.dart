import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/search/search_button.dart';
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
                image: AssetImage("assets/search.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: _outputs != null ? _resultElements() : _searchElements(),
          );
  }

  _searchElements() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
            alignment: Alignment.center,
            child: Text("New Observation",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900))),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SearchButton(
                text: 'Camera',
                icon: Icons.photo_camera,
                onPressed: pickImage,
              ),
              SearchButton(
                text: 'Gallery',
                icon: Icons.image,
                onPressed: pickImage,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _resultElements() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            alignment: Alignment.center,
            child: Text("Results",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900))),
        Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Color(0xff7c94b6),
            image: DecorationImage(
              image: _image == null
                  ? Image.asset('assets/grey.jpg')
                  : FileImage(_image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(300.0)),
            border: Border.all(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        ),
        Text(
          "${_outputs[0]["label"]}",
          style: TextStyle(
            fontSize: 20.0,
          ),
        )
      ],
    );
  }

  pickImage() async {
    var image = File(await _picker
        .getImage(source: ImageSource.gallery)
        .then((pickedImage) => pickedImage.path)
        .catchError((e) => {print('jjjjjjj')}));
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print('dsnajkdnjansdjnsanjkd');
    print(output);
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
