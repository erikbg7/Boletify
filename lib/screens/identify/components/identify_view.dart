import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/classifier/classifier_bloc.dart';

import 'identify_methods.dart';
import 'identify_results.dart';

class IdentifyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassifierBloc, ClassifierState>(
      builder: (context, state) {
        if (state is ClassifierMethodState) {
          return IdentifyMethods();
        }
        if (state is ClassifierResultState) {
          return IdentifyResults(
            result: state.output,
            mushroom: state.mushroom,
          );
        }
        if (state is ClassifierStateLoading) {
          return Container(
            alignment: Alignment.center,
            child: SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 6,
                color: Colors.black54,
              ),
              height: 70.0,
              width: 70.0,
            ),
          );
        }
        return Container(
          color: Colors.red,
          width: double.infinity,
          height: double.infinity,
        );
      },
    );
  }
}
