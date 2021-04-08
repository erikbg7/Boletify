import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
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
        SearchConfidence(confidence: result.confidence),
        SearchImage(image: result.image),
        Text(result.label, style: TextStyle(fontSize: 20.0))
      ],
    );
  }
}
