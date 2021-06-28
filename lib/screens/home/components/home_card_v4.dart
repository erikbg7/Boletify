import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/mushroom_labels_config.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';
import 'package:futter_project_tfg/utils/utils.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

class HomeCard extends StatelessWidget {
  final SearchLabels label;

  const HomeCard({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mushroom = mushroomLabels[label];
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        redirectTo(
          context: context,
          screen: Scaffold(
            appBar: AppBar(title: Text('Búsqueda')),
            body: SearchScreen(
              filter: [label],
              mushroomsList: getMushroomsListMock(),
            ),
          ),
        );
      },
      child: Container(
        width: size.width * 0.46,
        height: size.height * 0.12,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.3)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 4,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.2, 1],
                      colors: mushroom.colors),
                ),
              ),
            ),
            Center(
              child: Container(
                width: size.width * 0.3,
                child: Text(
                  mushroom.tooltip,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: CustomIcon(
                image: mushroom.imageUrl,
                tooltip: mushroom.tooltip,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}