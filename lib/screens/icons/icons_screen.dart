import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';

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
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "EDIBILITY ICONS",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 20),
                DetailLabels(labels: [
                  SearchLabels.edible,
                  SearchLabels.toxic,
                  SearchLabels.unknown
                ]),
                SizedBox(height: 25),
                Text(
                  "SEASON ICONS",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 20),
                DetailLabels(labels: [
                  SearchLabels.spring,
                  SearchLabels.summer,
                  SearchLabels.autumn,
                  SearchLabels.winter
                ]),
                SizedBox(height: 20),
                BlocBuilder<MushroomsBloc, MushroomsState>(
                    builder: (context, state) {
                  return Column(
                    children: [
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          BlocProvider.of<MushroomsBloc>(context)
                              .add(FindMushroomById('Amanita'));
                        },
                        child: Text('FindByName'),
                      ),
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          BlocProvider.of<MushroomsBloc>(context)
                              .add(GetAllMushrooms());
                        },
                        child: Text('GetAllMuhsrooms'),
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
