import 'package:flutter/material.dart';

class DetailThumbnail extends StatelessWidget {
  final ImageProvider image;

  const DetailThumbnail({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'result-image',
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
