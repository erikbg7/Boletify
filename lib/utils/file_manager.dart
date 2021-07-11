import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:futter_project_tfg/models/mushroom_description_model.dart';
import 'package:path_provider/path_provider.dart';

const String fileName = 'mushroomsBackup.json';

class FileManager {
  File _backupFile;

  Future<void> initializeFileManager() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String path = directory.path;
    _backupFile = new File('$path/$fileName');
  }

  void setMushroomsBackupList2(List<MushroomDescription> list) {
    var jsonMushroom = list[1].toJson();
    var jsonString = jsonEncode(jsonMushroom);
    _backupFile.writeAsString(jsonString);
  }

  Future<List<MushroomDescription>> getMushroomsBackupList2() async {
    List<MushroomDescription> list = [];
    if(await _backupFile.exists()) {
      var _jsonString = _backupFile.readAsStringSync();
      var _jsonMap = jsonDecode(_jsonString);
      print('RESULT:::: $_jsonString');
      print('RESULT2:::: $_jsonMap');
      var m = MushroomDescription.fromJson(_jsonMap);
      print(m.name);
      print(m.scientificName);
      print(m.commonNames);
      print(m.tags);
      print(m.cap);
      print(m.gills);
      print(m.stalk);
      print(m.flesh);
      print(m.habitat);
      print(m.observations);
      list.add(m);
    }
    return list;
  }
}
