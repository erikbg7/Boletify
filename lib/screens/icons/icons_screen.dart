import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';

class IconsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icons"),
      ),
      body: BlocProvider(
        create: (BuildContext context) => MushroomsBloc(),
        child: Container(
          color: Colors.black38,
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: BlocBuilder<MushroomsBloc, MushroomsState>(
                builder: (context, state) {
              return Column(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      BlocProvider.of<MushroomsBloc>(context)
                          .add(FindMushroomById('Amanita'));
                    },
                    child: Text('FindByName'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      BlocProvider.of<MushroomsBloc>(context)
                          .add(GetAllMushrooms());
                    },
                    child: Text('GetAllMuhsrooms'),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
