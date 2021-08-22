import 'package:flutter/cupertino.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/theme.dart';
import 'package:futter_project_tfg/widgets/divider_text_short.dart';

class DetailDescription extends StatelessWidget {
  final MushroomInfo mushroom;

  const DetailDescription({Key? key, required this.mushroom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100, left: 20, right: 20),
      scrollDirection: Axis.vertical, //.horizontal
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: mushroom.name.isEmpty
            ? [Center(child: Text('not found'))]
            : [
                ...buildSection('BARRET', mushroom.cap),
                ...buildSection('HIMENI', mushroom.gills),
                ...buildSection('PEU', mushroom.stalk),
                ...buildSection('CARN', mushroom.flesh),
                ...buildSection('HABITAT', mushroom.habitat),
                ...buildSection('OBSERVACIONS', mushroom.observations),
              ],
      ),
    );
  }

  List<Widget> buildSection(String title, String text) {
    if (text.isNotEmpty) {
      return [
        SizedBox(height: 10),
        Text(title, style: TextStyles.detailSectionTitle),
        DividerTextShort(top: 2, bottom: 10),
        Text(text, style: TextStyles.detailSectionText)
      ];
    } else {
      return [];
    }
  }
}
