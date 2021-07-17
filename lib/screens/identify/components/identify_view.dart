import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';

import 'identify_methods.dart';
import 'identify_results.dart';

class IdentifyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushroomsBloc, MushroomsState>(
        builder: (context, state) {
      print('---------- STATE $state');
      if (state is MushroomsInitial) {
        return IdentifyMethods();
      }
      if (state is MushroomClassified) {
        return IdentifyResults(result: state.output);
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
    });
  }
}
