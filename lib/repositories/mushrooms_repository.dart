import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/utils/file_manager.dart';

class MushroomsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<MushroomInfo>> _fetchLists() async {
    final FileManager fileManager = FileManager();
    await fileManager.initializeFileManager();
    fileManager.setMushroomsBackupList(mushroomsListMock);
    final List<MushroomInfo> list = await fileManager.getMushroomsBackupList();

    print('Mushroom List:  $list');

    //TODO: if we cannot get list from Firebase, we will use the backup one
    CollectionReference<Map<String, dynamic>> ref = _db.collection("boletus");
    final QuerySnapshot<Map<String, dynamic>> activities = await ref.get();
    return activities.docs
        .map((doc) => MushroomInfo.fromFirestore(doc.data()))
        .toList();
  }

  Future<List<MushroomInfo>> getMushroomsList() async {
    print('--------- fecthing all mushrooms...');
    return await _fetchLists();
  }
}
