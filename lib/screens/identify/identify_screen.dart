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
  final int bgImage = Random().nextInt(5);

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.blue.withOpacity(0.7), BlendMode.dstATop),
          image: AssetImage("assets/search_background/$bgImage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      child: BlocProvider(
        create: (BuildContext context) => MushroomsBloc(),
        child: IdentifyView(),
      ),
    );
  }
}
