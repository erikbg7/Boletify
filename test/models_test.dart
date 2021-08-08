import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/mushroom_info_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';

testTagsFromAndToJSON() {
  final List<Tag> tags = [Tag.winter, Tag.edible];
  final List<Tag> deserializedTags = tagsFromJson(tagsToJson(tags));
  tags.forEach((tag) => expect(deserializedTags.contains(tag), true));
}

testMockedMushroomList() {
  var list = getMushroomsListMock();
  expect(list.length, 15);
}

testMushroomDescriptionFromToJSON() {
  final MushroomInfo mushroom = MushroomInfo(
      name: 'name',
      scientificName: 'scientificName',
      commonNames: 'commonNames',
      tags: [],
      cap: 'cap',
      gills: 'gills',
      stalk: 'stalk',
      flesh: 'flesh',
      habitat: 'habitat',
      observations: 'observations');

  final MushroomInfo deserializedMushroom =
  MushroomInfo.fromJson(mushroom.toJson());

  expect(deserializedMushroom.name == mushroom.name, true);
  expect(deserializedMushroom.scientificName == mushroom.scientificName, true);
  expect(deserializedMushroom.commonNames == mushroom.commonNames, true);
  expect(deserializedMushroom.cap == mushroom.cap, true);
  expect(deserializedMushroom.gills == mushroom.gills, true);
  expect(deserializedMushroom.stalk == mushroom.stalk, true);
  expect(deserializedMushroom.flesh == mushroom.flesh, true);
  expect(deserializedMushroom.habitat == mushroom.habitat, true);
  expect(deserializedMushroom.observations == mushroom.observations, true);

}

void main() {
  test('MushroomInfo model has mocked list', testMockedMushroomList);
  test('Tags to JSON and from JSON', testTagsFromAndToJSON);
  test('MushroomDescription from/to JSON', testMushroomDescriptionFromToJSON);
}
