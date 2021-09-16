import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/screens/identify/results/confidence.dart';

isHighConfidence(ClassifierOutput result) => result.confidence > 0.5;

isMediumConfidence(ClassifierOutput result) => result.confidence > 0.1;

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
    if (isHighConfidence(result))
      return HighConfidence(result: result, mushroom: mushroom);
    if (isMediumConfidence(result)) return MediumConfidence(result: result);
    return LowConfidence(result: result);
  }
}
