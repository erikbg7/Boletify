import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_card.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_description.dart';
import 'package:futter_project_tfg/theme.dart';
import 'package:futter_project_tfg/widgets/divider_text_short.dart';

class DetailBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MushroomInfo mushroom = getMushroomsListMock()[0];

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 250.0,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/backgrounds/forest.jpeg'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
            color: Color(0xFF112523),
            margin: EdgeInsets.only(top: 200),
            child: Column(
              children: [
                DetailCard(
                    name: mushroom.name,
                    scientificName: mushroom.scientificName,
                    tags: mushroom.tags),
                SizedBox(height: 20),
                Expanded(child: DetailDescription(mushroom: mushroom)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
