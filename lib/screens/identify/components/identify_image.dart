import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/screens/detail/detail_screen.dart';

class IdentifyImage extends StatelessWidget {
  final File image;

  const IdentifyImage({Key? key, required this.image}) : super(key: key);

//  Hero tag for this item?
//  Would have a nice transition to details screen, would look cool
//  https://www.youtube.com/watch?v=Be9UH1kXFDw&ab_channel=GoogleDevelopers
//  Create new PR
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateTo(context),
      child: Hero(
        tag: 'result-image',
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
            color: Color(0xff7c94b6),
            borderRadius: BorderRadius.all(Radius.circular(300.0)),
            border: Border.all(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          child: CircleAvatar(backgroundImage: FileImage(image)),
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context) {
    final MushroomInfo selected = mushroomsListMock.firstWhere(
        (element) => element.name == 'Murgula',
        orElse: () => MushroomInfo.buildEmpty());

    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) => DetailScreen(image: image, mushroom: selected),
    ));
  }
}
