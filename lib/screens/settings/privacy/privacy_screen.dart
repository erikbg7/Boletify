import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacitat')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            'No recollim ni utilitzem la ninguna informació personal, disfruta-ho!',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
