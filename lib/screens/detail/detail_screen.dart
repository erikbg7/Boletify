import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_image.dart';

import 'components/detail_labels.dart';

class DetailScreen extends StatelessWidget {
  final File image;
  final MushroomInfo mushroom;
  final String notFoundMessage =
      'No hi ha informació disponible per aquest bolet actualment';

  const DetailScreen({Key key, this.image, this.mushroom}) : super(key: key);

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
                              DetailLabels(labels: ['toxic', 'autum']),
                              SizedBox(width: double.infinity, height: 15),
                              Text(
                                'Amanita'.toUpperCase(),
                                style: TextStyle(
                                    fontFamily: 'Milliard', fontSize: 20),
                              ),
                              Text(
                                'Amanita Muscaria',
                                style: TextStyle(
                                    fontFamily: 'Milliard',
                                    fontSize: 20,
                                    color: Colors.white70),
                              ),
//                              SizedBox(width: double.infinity, height: 25),
//                              DetailLabels(
//                                  labels: ['edible', 'spring', 'summer']),
//                              SizedBox(width: double.infinity, height: 15),
//                              Text(
//                                'Ou de Reig'.toUpperCase(),
//                                style: TextStyle(
//                                    fontFamily: 'Milliard', fontSize: 20),
//                              ),
//                              Text(
//                                'Amanita Caesaria',
//                                style: TextStyle(
//                                    fontFamily: 'Milliard',
//                                    fontSize: 20,
//                                    color: Colors.white70),
//                              ),
                            ],
                          ),
                        ),
//                        Text(mushroom.nameScientific),
//                        if (mushroom.nameAKA.isEmpty) Text('Second Widget'),
//                        Text(mushroom.season),
//                        Text(mushroom.edibility.toString()),
                        Text(
                          mushroom.description,
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          mushroom.location,
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
