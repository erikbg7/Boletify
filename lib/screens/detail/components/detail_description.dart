import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/colors.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/theme.dart';

class DetailDescription extends StatelessWidget {
  final Mushroom mushroom;

  const DetailDescription({Key? key, required this.mushroom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
      scrollDirection: Axis.vertical, //.horizontal
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: mushroom.name.isEmpty
            ? [Center(child: Text('not found'))]
            : [
                DescriptionSection(title: 'BARRET', text: mushroom.cap),
                DescriptionSection(title: 'HIMENI', text: mushroom.gills),
                DescriptionSection(title: 'PEU', text: mushroom.stalk),
                DescriptionSection(title: 'CARN', text: mushroom.flesh),
                DescriptionSection(title: 'HABITAT', text: mushroom.habitat),
                DescriptionSection(
                    title: 'OBSERVACIONS', text: mushroom.observations),
              ],
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  final String title;
  final String text;

  const DescriptionSection({Key? key, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),
            Text(title, style: TextStyles.detailSectionTitle),
            const SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      width: 2.0, color: BoletifyColors.skyBlue500),
                ),
              ),
              child: Text(text, style: TextStyles.detailSectionText),
            ),
            const SizedBox(height: 10),
          ])
        : const SizedBox();
  }
}
