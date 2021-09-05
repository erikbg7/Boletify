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

testMushroomsFromFirestore() {
  final MushroomInfo mushroom = getMushroomsListMock()[0];
  final firestoreMushroom = MushroomInfo.fromFirestore(mushroom.toJson());
  expect(firestoreMushroom.name == mushroom.name, true);
  expect(firestoreMushroom.scientificName == mushroom.scientificName, true);
  expect(firestoreMushroom.commonNames == mushroom.commonNames, true);
  expect(firestoreMushroom.cap == mushroom.cap, true);
  expect(firestoreMushroom.gills == mushroom.gills, true);
  expect(firestoreMushroom.stalk == mushroom.stalk, true);
  expect(firestoreMushroom.flesh == mushroom.flesh, true);
  expect(firestoreMushroom.habitat == mushroom.habitat, true);
  expect(firestoreMushroom.observations == mushroom.observations, true);
}

testMushroomDescriptionFromToJSON() {
  final MushroomInfo mushroom = getMushroomsListMock()[0];
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
  test('Mushroom info from Firestore', testMushroomsFromFirestore);
}
