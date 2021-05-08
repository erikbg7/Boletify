import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';

class DetailScreen extends StatelessWidget {

  final File image;
  final MushroomInfo mushroom;

  const DetailScreen({Key key, this.image, this.mushroom}) : super(key: key);


  @override
  Widget build(BuildContext context) {
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
          Container(
            child: Column(
              children: mushroom.name.isEmpty
                  ? [
                Text(
                    'No hi ha informació disponible per aquest bolet actualment')
              ]
                  : [
                Text(mushroom.name),
                Text(mushroom.nameScientific),
                Text(mushroom.nameAKA),
                Text(mushroom.description),
                Text(mushroom.location),
                Text(mushroom.observations),
                Text(mushroom.season),
                Text(mushroom.edibility.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
