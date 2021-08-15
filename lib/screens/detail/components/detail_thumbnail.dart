import 'package:flutter/material.dart';

class DetailThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/search_background/2.jpg'),
            fit: BoxFit.fill),
        color: Colors.grey,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
