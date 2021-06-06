import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_methods.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_results.dart';
import 'package:tflite/tflite.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
        child: BlocBuilder<MushroomsBloc, MushroomsState>(
            builder: (context, state) {
          print('---------- STATE $state');
          if (state is MushroomsInitial) {
            return SearchMethods();
          }
          if (state is MushroomClassified) {
            return SearchResults(result: state.output);
          }
          if (state is MushroomsLoading) {
            return Container(
              color: Colors.black12,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          return Container(
            color: Colors.red,
            width: double.infinity,
            height: double.infinity,
          );
        }),
      ),
    );
  }
}
