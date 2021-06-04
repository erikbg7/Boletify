import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/screens/search/components/search_button.dart';
import 'package:futter_project_tfg/screens/search/components/search_ttle.dart';
import 'package:image_picker/image_picker.dart';

class SearchMethods extends StatelessWidget {
  const SearchMethods({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SearchTitle(text: 'IDENTIFICACIÓ DEL BOLET'),
      Container(
        padding: EdgeInsets.only(bottom: 40),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          SearchButton(
            text: 'Camara',
            icon: Icons.photo_camera_outlined,
            onPressed: () {
              BlocProvider.of<MushroomsBloc>(context)
                  .add(ClassifyMushroom(ImageSource.camera));
            },
          ),
          SearchButton(
            text: 'Galeria',
            icon: Icons.broken_image_outlined,
            onPressed: () {
              BlocProvider.of<MushroomsBloc>(context)
                  .add(ClassifyMushroom(ImageSource.gallery));
            },
          ),
        ]),
      ),
    ]);
  }
}