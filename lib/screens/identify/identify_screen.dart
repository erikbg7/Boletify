import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/classifier/classifier_bloc.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_view.dart';

class IdentifyScreen extends StatelessWidget {
  final int bgImage = Random().nextInt(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nova identificació')),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/search_background/$bgImage.jpg"),
            colorFilter: ColorFilter.mode(
              Colors.blue.withOpacity(0.7),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: BlocProvider(
          create: (BuildContext context) =>
              ClassifierBloc()..add(InitializeClassifierEvent()),
          child: IdentifyView(),
        ),
      ),
    );
  }
}
