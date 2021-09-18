import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_image.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_title.dart';
import 'package:futter_project_tfg/theme.dart';
//import 'package:futter_project_tfg/widgets/show_up_transition.dart';

class IdentifyResults extends StatelessWidget {
  final ClassifierOutput result;
  final Mushroom mushroom;
  const IdentifyResults({
    Key? key,
    required this.result,
    required this.mushroom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IdentifyTitle(text: 'RESULTATS'),
        SizedBox(height: 10),
        Text("N'estic ${result.confidencePercentage} segur!"),
        SizedBox(height: 10),
        IdentifyImage(image: result.image, mushroom: mushroom),
        SizedBox(height: 5),
        DetailLabels(tags: mushroom.tags),
        SizedBox(width: double.infinity, height: 15),
//        ShowUp(
//          child:
        Text(
          mushroom.name.toUpperCase(),
          style: TextStyles.resultsNameTitle,
        ),
//          delay: 200,
//        ),
//        ShowUp(
//          child:
        Text(
          mushroom.scientificName,
          style: TextStyles.resultsNameSubtitle,
        ),
//          delay: 300,
//        ),
      ],
    );
  }
}
