import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/mushroom_labels_config.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

class HomeIcon extends StatelessWidget {
  final SearchLabels label;

  const HomeIcon({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String image = mushroomLabels[label]!.imageUrl;
    final String tooltip = mushroomLabels[label]!.tooltip;

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
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.15)),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.height * 0.15,
            child: CustomIcon(image: image, tooltip: tooltip, size: 10),
          ),
          Text(
            mushroomLabels[label]!.label,
            style: TextStyle(height: 1.5),
          )
        ],
      ),
    );
  }
}
