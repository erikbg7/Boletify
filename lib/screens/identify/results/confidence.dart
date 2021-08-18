import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_image.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_title.dart';
import 'package:futter_project_tfg/theme.dart';

class HighConfidence extends StatelessWidget {
  final ClassifierOutput result;

  const HighConfidence({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IdentifyTitle(text: 'RESULTATS'),
        SizedBox(height: 10),
        Text("N'estic ${result.confidencePercentage} segur!"),
        SizedBox(height: 10),
        IdentifyImage(image: result.image),
        SizedBox(height: 5),
        DetailLabels(tags: [Tag.toxic, Tag.autumn]),
        SizedBox(width: double.infinity, height: 15),
        Text('Amanita'.toUpperCase(), style: TextStyles.resultsNameTitle),
        Text('Amanita Muscaria', style: TextStyles.resultsNameSubtitle,
        ),
      ],
    );
  }
}

class MediumConfidence extends StatelessWidget {
  final ClassifierOutput result;

  const MediumConfidence({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IdentifyTitle(text: 'RESULTATS'),
        SizedBox(height: 10),
        Text(
            "I'll display a list with multiple results right here, horizontally scrollable")
      ],
    );
  }
}

class LowConfidence extends StatelessWidget {
  final ClassifierOutput result;

  const LowConfidence({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IdentifyTitle(text: 'RESULTATS'),
        SizedBox(height: 10),
        Text("Ho sento! No n'estic prou segur de poder oferir un resultat. "
            "Prova a pujar una altra foto, o si creus que no reconeixem el bolet, "
            "fes-nos un requeriment per afegirlo.")
      ],
    );
  }
}