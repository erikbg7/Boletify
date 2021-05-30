import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';


class MushroomsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<MushroomInfo>> _fetchLists() async {
    var ref = _db.collection("boletus");
    final QuerySnapshot activities = await ref.get();
    return activities.docs
        .map((doc) => MushroomInfo.fromFirestore(doc))
        .toList();
  }

  Future<List<MushroomInfo>> getMushroomsList() async {
    print('--------- fecthing all mushrooms...');
    return await _fetchLists();
  }
}