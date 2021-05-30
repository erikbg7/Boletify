import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/search/components/search_confidence.dart';
import 'package:futter_project_tfg/screens/search/components/search_ttle.dart';
import 'package:futter_project_tfg/screens/search/components/search_image.dart';

class SearchResults extends StatelessWidget {
  final ClassifierOutput result;

  const SearchResults({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SearchTitle(text: 'RESULTATS'),
        SearchImage(image: result.image),
        SizedBox(height: 20),
        DetailLabels(labels: ['toxic', 'autum']),
        SizedBox(width: double.infinity, height: 15),
        Text('Amanita'.toUpperCase(),
            style: TextStyle(fontFamily: 'Milliard', fontSize: 20)),
        Text(
          'Amanita Muscaria',
          style: TextStyle(
              fontFamily: 'Milliard', fontSize: 20, color: Colors.white70),
        ),
//        Text(result.label, style: TextStyle(fontSize: 20.0)),
        SearchConfidence(confidence: result.confidence),
        Text('${result.confidence}, ${result.label}')
      ],
    );
  }
}
