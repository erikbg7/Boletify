import 'package:flutter/material.dart';

// Wee should configure search screen to onnly give a result if confidence > 0.95
class SearchConfidence extends StatelessWidget {
  final num confidence;

  const SearchConfidence({Key key, this.confidence}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final confidencePercentage = (confidence*100).toStringAsFixed(2);
    return FlatButton(
        onPressed: () {}, child: Text("N'estic $confidencePercentage% segur!"));
  }
}
