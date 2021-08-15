import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/theme.dart';
import 'package:futter_project_tfg/widgets/divider_text_short.dart';

class DetailCard extends StatelessWidget {
  final String name;
  final String scientificName;
  final List<Tag> tags;

  const DetailCard(
      {Key? key,
      required this.name,
      required this.scientificName,
      required this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.25,
      decoration: BoxDecoration(
//        color: Color(0xFF434273),
        color: Color(0xFF1A4029),
//        color: Colors.white.withOpacity(0.2),
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: TextStyles.detailCardTitle),
          Text(scientificName, style: TextStyles.detailCardSubtitle),
          DividerTextShort(),
          DetailLabels(tags: tags, size: 30)
        ],
      ),
    );
  }
}
