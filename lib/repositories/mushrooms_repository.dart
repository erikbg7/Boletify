import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futter_project_tfg/models/mushroom_description_model.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/utils/file_manager.dart';

class MushroomsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<MushroomInfo>> _fetchLists() async {
    final FileManager fileManager = FileManager();
    await fileManager.initializeFileManager();
    fileManager.setMushroomsBackupList(getMushroomsListMock2());
    final List<MushroomDescription> list =
        await fileManager.getMushroomsBackupList();

    print('Mushroom List:  $list');

    //TODO: if we cannot get list from Firebase, we will use the backup one
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