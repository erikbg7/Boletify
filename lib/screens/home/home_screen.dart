import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/home/components/home_card.dart';
import 'package:futter_project_tfg/screens/home/components/scrollable_icons.dart';
import 'package:futter_project_tfg/widgets/security_disclaimer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boletus AI"),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SecurityDisclaimer(),
            HomeScrollableIcons(),
            Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
//                HomeCard(label: SearchLabels.edible),
//                HomeCard(label: SearchLabels.toxic),
//                HomeCard(label: SearchLabels.spring),
//                HomeCard(label: SearchLabels.summer),
//                HomeCard(label: SearchLabels.autumn),
//                HomeCard(label: SearchLabels.winter),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
