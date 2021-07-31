import 'package:flutter/material.dart';

class HomeSearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      height: size.height * 0.07,
      child: OutlinedButton(
        onPressed: () {},
//        onPressed: () async {
//          final result = await showSearch<MushroomInfo>(
//            context: context,
//            delegate: NameSearch(getMushroomsListMock()),
//          );
//
//          print(result.toString());
//        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search_outlined),
            SizedBox(width: size.width * 0.02),
            Text('Búsca un bolet...')
          ],
        ),
      ),
    );
  }
}
