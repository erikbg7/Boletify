import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/theme.dart';
import 'package:futter_project_tfg/widgets/divider_text_short.dart';

class DetailCard extends StatelessWidget {
  final MushroomInfo mushroom;

  const DetailCard({Key? key, required this.mushroom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.9,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        color: const Color(0xFF183A26),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          const BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Text(mushroom.name, style: TextStyles.detailCardTitle),
          Text(mushroom.scientificName, style: TextStyles.detailCardSubtitle),
          const DividerTextShort(),
          DetailLabels(tags: mushroom.tags, size: 30)
        ],
      ),
    );
  }
}


//        color: Color(0xFF434273),
//        color: Color(0xFF1A4029),
//        color: Colors.white.withOpacity(0.2),