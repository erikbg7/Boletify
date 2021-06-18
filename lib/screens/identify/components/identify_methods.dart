import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_button.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_title.dart';
import 'package:image_picker/image_picker.dart';

class IdentifyMethods extends StatelessWidget {
  const IdentifyMethods({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IdentifyTitle(text: 'IDENTIFICACIÓ DEL BOLET'),
      Container(
        padding: EdgeInsets.only(bottom: 40),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IdentifyButton(
            text: 'Camara',
            icon: Icons.photo_camera_outlined,
            onPressed: () {
              BlocProvider.of<MushroomsBloc>(context)
                  .add(ClassifyMushroom(ImageSource.camera));
            },
          ),
          IdentifyButton(
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