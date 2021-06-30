import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/mushroom_labels_config.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';
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
        Navigator.push(
          context,
          MaterialPageRoute<void>(builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(title: Text('Búsqueda')),
              body: SearchScreen(
                filter: [label],
                mushroomsList: getMushroomsListMock(),
              ),
            );
          }),
        );
      },
      child: Container(
        width: size.width * 0.46,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.2, 1],
                      colors: mushroom.colors)),
              child: Align(
                alignment: Alignment.centerRight,
                child: CustomIcon(
                  image: mushroom.imageUrl,
                  tooltip: mushroom.tooltip,
                  size: 20,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.15),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              height: 50,
              child: Center(
                  child: Text(
                    mushroom.tooltip,
                    textAlign: TextAlign.center,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
