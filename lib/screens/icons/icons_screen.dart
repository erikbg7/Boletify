import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';

class IconsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icons"),
      ),
      body: Container(
        color: Colors.black38,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "ICONS",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 50),
              Text(
                "EDIBILITY ICONS",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 20),
              DetailLabels(labels: [
                SearchLabels.edible,
                SearchLabels.toxic,
                SearchLabels.unknown
              ]),
              SizedBox(height: 25),
              Text(
                "SEASON ICONS",
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 20),
              DetailLabels(labels: [
                SearchLabels.spring,
                SearchLabels.summer,
                SearchLabels.autumn,
                SearchLabels.winter
              ]),
            ],
          ),
        ),
      ),
    );
  }
}