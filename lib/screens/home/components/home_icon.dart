import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/tags_config.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

class HomeIcon extends StatelessWidget {
  final Tag tag;

  const HomeIcon({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TagInfo tagInfo = infoFromTag(tag);
    final List<MushroomInfo> mushroomList = getMushroomsListMock();

    final String image = tagInfo.imageUrl;
    final String tooltip = tagInfo.tooltip;
    final String text = tagInfo.label;

    return InkWell(
      key: new Key('NavigateSearchScreen'),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(title: Text('Búsqueda')),
              body: SearchScreen(filter: [tag], mushroomsList: mushroomList),
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
          Text(text, style: TextStyle(height: 1.5))
        ],
      ),
    );
  }
}
