import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';


void main() {
  test('MushroomInfo model has mocked list', (){
    var list = getMushroomsListMock();
    expect(list.length, 8);
  });
  test('MushroomInfo model concat labels to string', (){
    var mushroom = MushroomInfo('name', 'name2', [SearchLabels.summer]);
    String result = mushroom.toConcatString();
    expect(result.contains('summer'), true);
  });
}
