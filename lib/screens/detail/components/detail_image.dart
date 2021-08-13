import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/tag_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';

class DetailImage extends StatelessWidget {
  final File image;
  final List<Tag> tags;

  const DetailImage({Key? key, required this.image, required this.tags})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'result-image',
      child: Container(
        width: double.infinity,
        height: 250.0,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 250.0,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage('assets/search_background/0.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: DetailLabels(
                alignment: MainAxisAlignment.end,
                tags: tags,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}