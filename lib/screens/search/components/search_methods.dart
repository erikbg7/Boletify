import 'package:flutter/material.dart';
import 'package:futter_project_tfg/screens/search/components/search_button.dart';
import 'package:futter_project_tfg/screens/search/components/search_ttle.dart';
import 'package:image_picker/image_picker.dart';

class SearchMethods extends StatelessWidget {
  final Function picker;

  const SearchMethods({Key key, this.picker}) : super(key: key);

  pickFromCamera() => picker(ImageSource.camera);

  pickFromGallery() => picker(ImageSource.gallery);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchTitle(text: 'IDENTIFICACIÓ DEL BOLET'),
        Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SearchButton(
                text: 'Camara',
                icon: Icons.photo_camera_outlined,
                onPressed: pickFromCamera,
              ),
              SearchButton(
                text: 'Galeria',
                icon: Icons.broken_image_outlined,
                onPressed: pickFromGallery,
              ),
            ],
          ),
        ),
      ],
    );
  }
}