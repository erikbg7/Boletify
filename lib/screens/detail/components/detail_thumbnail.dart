import 'package:flutter/material.dart';

class DetailThumbnail extends StatelessWidget {
  final ImageProvider image;

  const DetailThumbnail({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Hero(
      tag: 'result-image',
      child: Container(
        width: size.width * 0.2,
        height: size.width * 0.2,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          color: Colors.grey,
          borderRadius: BorderRadius.circular(100),
          boxShadow: <BoxShadow>[
            const BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
              offset: Offset(0.0, 0.0),
            )
          ],
        ),
      ),
    );
  }
}
