import 'package:flutter/material.dart';
import 'package:futter_project_tfg/utils/utils.dart';

class CreditsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Credits')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Divider(),
            Text('Developer: Erik Blanca Gomez'),
            const Divider(),
            Text('Email: erik.bg7@gmail.com'),
            const Divider(),
            Text('Github: www.github.com/erikbg7'),
            const Divider(),
            Text('Check the source code:'),
            InkWell(
              onTap: () =>
                  launchUrl('https://github.com/erikbg7/Flutter-Project'),
              child: Text(
                'wwww.github.com/erikbg7/Flutter-Project',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
