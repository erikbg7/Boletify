import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

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
          Center(
            child: Hero(
              tag: 'result-image',
              child: Container(
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Color(0xff7c94b6),
                  image: DecorationImage(
                    image: FileImage(image),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: new SingleChildScrollView(
              scrollDirection: Axis.vertical, //.horizontal
              child: Column(
                children: mushroom.name.isEmpty
                    ? [Text(notFoundMessage)]
                    : [
                  CustomIcon(type: EdibleType.poisonous, image: 'assets/edibility/edible.png', tooltip: 'this is a tooltip', color: Colors.green,),
                  Text(mushroom.name),
                        Text(mushroom.nameScientific),
                        if (mushroom.nameAKA.isEmpty) Text('Second Widget'),
                        Text(mushroom.season),
                        Text(mushroom.edibility.toString()),
                        Text(mushroom.description),
                        Text(mushroom.description),
                        Text(mushroom.description),
                        Text(mushroom.location),
                        Text(mushroom.observations),
                        Text(mushroom.observations),
                        Text(mushroom.observations),
                        Text(mushroom.observations),
                        Text(mushroom.observations),
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
