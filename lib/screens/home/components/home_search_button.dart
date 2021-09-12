import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/screens/search/search_delegate.dart';

class HomeSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      height: size.height * 0.07,
      child: OutlinedButton(
        onPressed: () async {
          await showSearch<Mushroom>(
            context: context,
            delegate: MushroomSearchDelegate(mushrooms: mushroomsListMock),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search_outlined),
            SizedBox(width: size.width * 0.02),
            Text('Búsca un bolet...')
          ],
        ),
      ),
    );
  }
}
