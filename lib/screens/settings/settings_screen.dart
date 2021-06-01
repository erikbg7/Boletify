import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boletus AI"),
      ),
      body: Container(
        color: Colors.black38,
        height: double.infinity,
        width: double.infinity,
        child: Center(child: Column(
          children: [
            SizedBox(height: 50),
            Text(
              "SETTINGS",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 50),
            Text(
              "EDIBILITY ICONS",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 20),
            DetailLabels(labels: ['edible', 'toxic', 'unknown']),
            SizedBox(height: 25),
            Text(
              "SEASON ICONS",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(height: 20),
            DetailLabels(
                labels: ['spring', 'summer', 'autum', 'winter']),
          ],
        )),
      ),
    );
  }
}