import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/screens/icons/icons_screen.dart';
import 'package:futter_project_tfg/screens/search/search_screen.dart';
import 'package:futter_project_tfg/widgets/security_disclaimer.dart';

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
                    SecurityDisclaimer(),
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
                          child: Text('GetAllMuhsrooms'),
                        ),
                      ],
                    ),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) {
                              return Scaffold(
                                appBar: AppBar(title: Text('Búsqueda')),
                                body: SearchScreen(
                                  filter: [],
                                  mushroomsList: getMushroomsListMock(),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: Text('Go to search'),
                    ),
                    FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                return IconsScreen();
                              },
                            ),
                          );
                        },
                        child: Text('Go to icons'))
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
