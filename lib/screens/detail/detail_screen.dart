import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_image.dart';

class DetailScreen extends StatelessWidget {
  final File image;
  final MushroomInfo mushroom;
  final String notFoundMessage =
      'No hi ha informació disponible per aquest bolet actualment';

  const DetailScreen({Key? key, required this.image, required this.mushroom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DetailImage(image: image, tags: mushroom.tags),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.black,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mushroom.name.toUpperCase(),
                  style: TextStyle(fontFamily: 'Milliard', fontSize: 20),
                ),
                Text(
                  mushroom.scientificName,
                  style: TextStyle(
                      fontFamily: 'Milliard',
                      fontSize: 20,
                      color: Colors.white70),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: new SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              scrollDirection: Axis.vertical, //.horizontal
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: mushroom.name.isEmpty
                    ? [Center(child: Text(notFoundMessage))]
                    : [
                        ...buildSection('Barret', mushroom.cap),
                        ...buildSection('Himeni', mushroom.gills),
                        ...buildSection('Peu', mushroom.stalk),
                        ...buildSection('Carn', mushroom.flesh),
                        ...buildSection('Habitat', mushroom.habitat),
                        ...buildSection('Observations', mushroom.observations),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildSection(String title, String text) {
    if (text.isNotEmpty) {
      return [
        SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.grey[200],
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.grey[200], fontSize: 20),
        )
      ];
    } else {
      return [];
    }
  }
}
