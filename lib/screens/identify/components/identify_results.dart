import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_image.dart';
import 'package:futter_project_tfg/screens/identify/components/identify_title.dart';
import 'package:futter_project_tfg/theme.dart';
import 'package:futter_project_tfg/widgets/animations/fade_in.dart';
import 'package:futter_project_tfg/widgets/animations/show_up.dart';

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
        const SizedBox(height: 10),
        Text("N'estic ${result.confidencePercentage} segur!"),
        const SizedBox(height: 10),
        FadeIn(
            child: IdentifyImage(image: result.image, mushroom: mushroom),
            delay: 100),
        const SizedBox(height: 5),
        FadeIn(child: DetailLabels(tags: mushroom.tags), delay: 100),
        const SizedBox(height: 15),
        ShowUp(
          child: Text(mushroom.name.toUpperCase(),
              style: TextStyles.resultsNameTitle),
          delay: 200,
        ),
        ShowUp(
          child: Text(
            mushroom.scientificName,
            style: TextStyles.resultsNameSubtitle,
          ),
          delay: 400,
        ),
      ],
    );
  }
}
