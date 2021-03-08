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
    return Scaffold(
        body: _buildBody2());
  }

  _buildBody2() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/search.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text("New Observation",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline1)),
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
      ),
    );
  }

  _buildBody() {
    return _loading
        ? Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null ? Container() : Image.file(_image),
                SizedBox(
                  height: 20,
                ),
                _outputs != null
                    ? Text(
                        "${_outputs[0]["label"]}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          background: Paint()..color = Colors.white,
                        ),
                      )
                    : Container()
              ],
            ),
          );
  }

  pickImage() async {
    print('piicking iimage');
    var image = File(await _picker
        .getImage(source: ImageSource.gallery)
        .then((pickedImage) => pickedImage.path)
        .catchError((e) => {print('jjjjjjj')}));
    print('sadsadsad');
    print(image);
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
