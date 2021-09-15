import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/screens/identify/results/confidence.dart';

isHighConfidence(ClassifierOutput result) => result.confidence > 0.95;

isMediumConfidence(ClassifierOutput result) => result.confidence > 0.50;

class IdentifyResults extends StatelessWidget {
  final ClassifierOutput result;
  final Mushroom mushroom;
  const IdentifyResults({
    Key? key,
    required this.result,
    required this.mushroom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HighConfidence(result: result, mushroom: mushroom);
//    if (isHighConfidence(result)) return HighConfidence(result: result);
//    if(isMediumConfidence(result)) return MediumConfidence(result: result);
//    return LowConfidence(result: result);
  }
}
