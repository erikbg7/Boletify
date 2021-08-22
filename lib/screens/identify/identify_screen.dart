import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_view.dart';
import 'package:tflite/tflite.dart';

class IdentifyScreen extends StatefulWidget {
  @override
  _IdentifyScreenState createState() => _IdentifyScreenState();
}

class _IdentifyScreenState extends State<IdentifyScreen> {
  final int bgImage = Random().nextInt(4);

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova identificació')),
      body: Container(
        decoration: buildIdentifyBackground(bgImage),
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: BlocProvider(
          create: (BuildContext context) => MushroomsBloc(),
          child: IdentifyView(),
        ),
      ),
    );
  }
}

BoxDecoration buildIdentifyBackground(int bgImage) {
  return BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage("assets/search_background/$bgImage.jpg"),
      colorFilter: ColorFilter.mode(
        Colors.blue.withOpacity(0.7),
        BlendMode.dstATop,
      ),
    ),
  );
}
