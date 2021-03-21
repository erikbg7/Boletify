import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/search/components/search_button.dart';
import 'package:futter_project_tfg/screens/search/components/search_ttle.dart';

class SearchIdentify extends StatelessWidget {

  final Function uploadFromGallery;
  final Function uploadFromCamera;

  const SearchIdentify({Key key, this.uploadFromGallery, this.uploadFromCamera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchTitle(text: 'IDENTIFICACIÓ DEL BOLET'),
        Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchButton(
                text: 'Camara',
                icon: Icons.photo_camera_outlined,
                onPressed: uploadFromCamera,
              ),
              SearchButton(
                text: 'Galeria',
                icon: Icons.broken_image_outlined,
                onPressed: uploadFromGallery,
              ),
            ],
          ),
        ),
      ],
    );
  }
}