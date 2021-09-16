import 'package:flutter/material.dart';
import 'package:futter_project_tfg/theme.dart';

class IdentifyTitle extends StatelessWidget {
  final String text;

  const IdentifyTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyles.resultsTitle,
      ),
    );
  }
}
