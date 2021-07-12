import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';

testTagsFromAndToJSON() {
  final List<SearchLabels> tags = [SearchLabels.winter, SearchLabels.edible];
  final List<SearchLabels> deserializedTags = tagsFromJson(tagsToJson(tags));
  tags.forEach((tag) => expect(deserializedTags.contains(tag), true));
}

testMockedMushroomList() {
  var list = getMushroomsListMock();
  expect(list.length, 8);
}

testMushroomtoString() {
  var mushroom = MushroomInfo('name', 'name2', [SearchLabels.summer]);
  String result = mushroom.toConcatString();
  expect(result.contains('summer'), true);
}

void main() {
  test('MushroomInfo model has mocked list', testMockedMushroomList);
  test('MushroomInfo model concat labels to string', testMushroomtoString);
  test('Tags to JSON and from JSON', testTagsFromAndToJSON);
}
