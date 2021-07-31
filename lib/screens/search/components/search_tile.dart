import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';

class SearchTile extends StatelessWidget {
  final MushroomInfo item;

  const SearchTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: double.infinity,
      color: Colors.black26,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/search_background/2.jpg'), fit: BoxFit.fill),
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
              Text(item.nameScientific, style: TextStyle(fontSize: 15, color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }
}
