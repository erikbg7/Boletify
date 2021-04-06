import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/search/components/search_confidence.dart';
import 'package:futter_project_tfg/screens/search/components/search_ttle.dart';

class SearchResults extends StatelessWidget {
  final File image;
  final String result;
  final double confidence;

  const SearchResults({Key key, this.image, this.result, this.confidence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SearchTitle(text: 'RESULTATS'),
        SearchConfidence(confidence: confidence),
        Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Color(0xff7c94b6),
            image: DecorationImage(
              image: image == null
                  ? Image.asset('assets/grey.jpg')
                  : FileImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(300.0)),
            border: Border.all(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        ),
        Text(result, style: TextStyle(fontSize: 20.0))
      ],
    );
  }
}
