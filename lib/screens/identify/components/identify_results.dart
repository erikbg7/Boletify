import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_title.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_image.dart';

class IdentifyResults extends StatelessWidget {
  final ClassifierOutput result;

  const IdentifyResults({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IdentifyTitle(text: 'RESULTATS'),
        IdentifyImage(image: result.image),
        SizedBox(height: 20),
        DetailLabels(tags: [Tag.toxic, Tag.autumn]),
        SizedBox(width: double.infinity, height: 15),
        Text('Amanita'.toUpperCase(),
            style: TextStyle(fontFamily: 'Milliard', fontSize: 20)),
        Text(
          'Amanita Muscaria',
          style: TextStyle(
              fontFamily: 'Milliard', fontSize: 20, color: Colors.white70),
        ),
        Text("N'estic ${(result.confidence*100).toStringAsFixed(2)}% segur!")
      ],
    );
  }
}
