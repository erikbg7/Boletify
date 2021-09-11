import 'package:flutter/material.dart';
import 'package:futter_project_tfg/widgets/security_disclaimer.dart';

class DisclaimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Responsabilitat')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            SecurityDisclaimer.message,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
