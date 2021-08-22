import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_card.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_description.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_information.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_thumbnail.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_background.dart';

class DetailScreen extends StatelessWidget {
  final File image;
  final MushroomInfo mushroom;

  const DetailScreen({Key? key, required this.image, required this.mushroom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            DetailBackground(),
            DetailInformation(
              children: [
                DetailCard(mushroom: mushroom),
                SizedBox(height: 20),
                Expanded(child: DetailDescription(mushroom: mushroom)),
              ],
            ),
            Align(
              alignment: FractionalOffset(0.5, 0.21),
              child: DetailThumbnail(),
            ),
          ],
        ),
      ),
    );
  }
}
