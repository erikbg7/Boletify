import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futter_project_tfg/bloc/mushrooms/mushrooms_bloc.dart';

class FetchButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fetch Buttons")),
      body: BlocProvider(
        create: (BuildContext context) => MushroomsBloc(),
        child: FetchButtons(),
      ),
    );
  }
}

class FetchButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MushroomsBloc, MushroomsState>(
      builder: (context, state) => Center(
        child: Column(
          children: [
            TextButton(
              style: TextButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                BlocProvider.of<MushroomsBloc>(context)
                    .add(FindMushroomById('Amanita'));
              },
              child: Text('FindByName'),
            ),
            TextButton(
              style: TextButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                BlocProvider.of<MushroomsBloc>(context).add(GetAllMushrooms());
              },
              child: Text('GetAllMuhsrooms'),
            ),
          ],
        ),
      ),
    );
  }
}
