import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futter_project_tfg/config/mushroom_mock_config.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/utils/file_manager.dart';

class MushroomsRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  static List<Mushroom> mushroomList = mushroomsListMock;


  Future<List<Mushroom>> _fetchLists() async {
    final FileManager fileManager = FileManager();
    await fileManager.initializeFileManager();
    fileManager.setMushroomsBackupList(mushroomsListMock);
    final List<Mushroom> list = await fileManager.getMushroomsBackupList();

    print('Mushroom List:  $list');


    //TODO: if we cannot get list from Firebase, we will use the backup one
    CollectionReference<Map<String, dynamic>> ref = _db.collection("boletus");
    final QuerySnapshot<Map<String, dynamic>> boletusQuery = await ref.get();
    print('query $boletusQuery');

    final List<Mushroom> firestoreList = boletusQuery.docs
        .map((doc) => Mushroom.fromFirestore(doc.data()))
        .toList();

    if(firestoreList.length > 0) {
      mushroomList = firestoreList;
    }

    return boletusQuery.docs
        .map((doc) => Mushroom.fromFirestore(doc.data()))
        .toList();
  }


  Future<List<Mushroom>> getMushroomsList() async {
    print('--------- fecthing all mushrooms...');
    return await _fetchLists();
  }
}
