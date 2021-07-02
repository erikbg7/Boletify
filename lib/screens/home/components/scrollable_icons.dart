import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/mushroom_labels_config.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/widgets/custom_icon.dart';

class HomeScrollableIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
        List.generate(
            SearchLabels.values.length,
            (index) => ScrollableItem(label: SearchLabels.values.elementAt(index))),
      ),
    );
  }
}



class ScrollableItem extends StatelessWidget {
  final SearchLabels label;

  const ScrollableItem({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey.withOpacity(0.15)),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(10),
          height: 90,
          width: 90,
          child: CustomIcon(
            image: mushroomLabels[label].imageUrl,
            tooltip: mushroomLabels[label].tooltip,
            size: 10,
          ),
        ),
        Text(mushroomLabels[label].label)
      ],
    );
  }
}
