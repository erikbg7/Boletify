import 'dart:io';

import 'package:flutter/material.dart';
import 'package:futter_project_tfg/colors.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/screens/detail/detail_screen.dart';
import 'package:futter_project_tfg/utils/utils.dart';

class SearchTile extends StatelessWidget {
  final Mushroom item;

  const SearchTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageFile = File('assets/search_background/2.jpg');

    return Material(
      child: InkWell(
        onTap: () => redirectTo(
            context: context,
            screen: DetailScreen(
                image: AssetImage(imageFile.path), mushroom: item)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: double.infinity,
          color: BoletifyColors.green900.withOpacity(0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/search_background/2.jpg'),
                      fit: BoxFit.fill),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.name, style: TextStyle(fontSize: 20)),
                  Text(item.scientificName,
                      style: TextStyle(fontSize: 15, color: Colors.white70)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
