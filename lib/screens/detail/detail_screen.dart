import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_card.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_image.dart';
import 'package:futter_project_tfg/screens/detail/detail_background.dart';
import 'package:futter_project_tfg/theme.dart';
import 'package:futter_project_tfg/widgets/divider_text_short.dart';

class DetailScreen extends StatelessWidget {
  final File image;
  final MushroomInfo mushroom;
  final String notFoundMessage =
      'No hi ha informació disponible per aquest bolet actualment';

  const DetailScreen({Key? key, required this.image, required this.mushroom})
      : super(key: key);

//  #112523
//  17, 37, 25
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailBackground()
//      Column(
//        children: [
//          DetailImage(image: image, tags: mushroom.tags),
//          Container(
//            padding: EdgeInsets.all(10),
//            color: Color(0xF0434273),
//            width: double.infinity,
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
//              children: [
//                DetailCard(
//                  name: mushroom.name,
//                  scientificName: mushroom.scientificName,
//                  tags: mushroom.tags,
//                ),
//              ],
//            ),
//          ),
//          Expanded(
//            flex: 1,
//            child: new SingleChildScrollView(
//              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
//              scrollDirection: Axis.vertical, //.horizontal
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: mushroom.name.isEmpty
//                    ? [Center(child: Text(notFoundMessage))]
//                    : [
//                        ...buildSection('BARRET', mushroom.cap),
//                        ...buildSection('HIMENI', mushroom.gills),
//                        ...buildSection('PEU', mushroom.stalk),
//                        ...buildSection('CARN', mushroom.flesh),
//                        ...buildSection('HABITAT', mushroom.habitat),
//                        ...buildSection('OBSERVACIONS', mushroom.observations),
//                      ],
//              ),
//            ),
//          ),
//        ],
//      ),
    );
  }

  List<Widget> buildSection(String title, String text) {
    if (text.isNotEmpty) {
      return [
        SizedBox(height: 10),
        Text(title, style: TextStyles.detailSectionTitle),
        DividerTextShort(top: 2, bottom: 10),
        Text(text, style: TextStyles.detailSectionText)
      ];
    } else {
      return [];
    }
  }
}
