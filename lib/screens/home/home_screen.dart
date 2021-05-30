import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/screens/detail/components/detail_labels.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Boletus AI"),
      ),
      body: BlocProvider(
        create: (BuildContext context) => MushroomsBloc(),
        child: Container(
          color: Colors.black38,
          height: double.infinity,
          width: double.infinity,
          child: BlocBuilder<MushroomsBloc, MushroomsState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "HOME",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Text('GetAllMuhsroms'),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Text(
                      "EDIBILITY ICONS",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 20),
                    DetailLabels(labels: ['edible', 'toxic', 'unknown']),
                    SizedBox(height: 25),
                    Text(
                      "SEASON ICONS",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(height: 20),
                    DetailLabels(
                        labels: ['spring', 'summer', 'autum', 'winter']),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
