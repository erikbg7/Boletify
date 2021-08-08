import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:path_provider/path_provider.dart';

const String fileName = 'mushroomsBackup.json';

class FileManager {
  late File _backupFile;

  Future<void> initializeFileManager() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    _backupFile = new File('$path/$fileName');
  }

  void setMushroomsBackupList(List<MushroomInfo> list) {
    var jsonMushrooms = [];
    list.forEach((element) => jsonMushrooms.add(element.toJson()));
    var jsonString = jsonEncode(jsonMushrooms);
    _backupFile.writeAsString(jsonString);
  }

  Future<List<MushroomInfo>> getMushroomsBackupList() async {
    List<MushroomInfo> list = [];
    if (await _backupFile.exists()) {
      var _jsonString = _backupFile.readAsStringSync();
      var _jsonMap = jsonDecode(_jsonString) as List;
      _jsonMap.forEach((element) => list.add(MushroomInfo.fromJson(element)));
    }
    return list;
  }
}
