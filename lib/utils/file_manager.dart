import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:futter_project_tfg/models/mushroom_description_model.dart';
import 'package:path_provider/path_provider.dart';

const String fileName = 'mushroomsBackup.json';

class FileManager {
  late File _backupFile;

  Future<void> initializeFileManager() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    _backupFile = new File('$path/$fileName');
  }

  void setMushroomsBackupList(List<MushroomDescription> list) {
    var jsonMushrooms = [];
    list.forEach((element) => jsonMushrooms.add(element.toJson()));
    var jsonString = jsonEncode(jsonMushrooms);
    _backupFile.writeAsString(jsonString);
  }

  Future<List<MushroomDescription>> getMushroomsBackupList() async {
    List<MushroomDescription> list = [];
    if (await _backupFile.exists()) {
      var _jsonString = _backupFile.readAsStringSync();
      var _jsonMap = jsonDecode(_jsonString) as List;
      _jsonMap.forEach((element) => list.add(MushroomDescription.fromJson(element)));
    }
    return list;
  }
}
