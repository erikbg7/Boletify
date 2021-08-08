import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_image.dart';

import 'components/detail_labels.dart';

class DetailScreen extends StatelessWidget {
  final File image;
  final MushroomInfo mushroom;
  final String notFoundMessage =
      'No hi ha informació disponible per aquest bolet actualment';

  const DetailScreen({Key? key, required this.image, required this.mushroom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
//    mushroom.nameAKA.isNotEmpty
    return Scaffold(
      body: Column(
        children: [
          DetailImage(image: image),
          Expanded(
            flex: 1,
            child: new SingleChildScrollView(
              padding: EdgeInsets.all(20),
              scrollDirection: Axis.vertical, //.horizontal
              child: Column(
                children: mushroom.name.isEmpty
                    ? [Text(notFoundMessage)]
                    : [
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DetailLabels(tags: [Tag.toxic, Tag.autumn]),
                              SizedBox(width: double.infinity, height: 15),
                              Text(
                                mushroom.name.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Milliard', fontSize: 20),
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
                        Text(
                          mushroom.cap,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          mushroom.gills,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          mushroom.stalk,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          mushroom.flesh,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          mushroom.habitat,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          mushroom.observations,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  getInformationBlock(String text) {
    if (text.isNotEmpty) {
      return Text(text);
    }
  }
}
