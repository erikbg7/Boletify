import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/mushroom_mock_config.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';

testTagsFromAndToJSON() {
  final List<Tag> tags = [Tag.winter, Tag.edible];
  final List<Tag> deserializedTags = tagsFromJson(tagsToJson(tags));
  tags.forEach((tag) => expect(deserializedTags.contains(tag), true));
}

testMockedMushroomList() {
  expect(mushroomsListMock.length, 15);
}

testMushroomsFromFirestore() {
  final Mushroom mushroom = mushroomsListMock[0];
  final firestoreMushroom = Mushroom.fromFirestore(mushroom.toJson());
  expect(firestoreMushroom == mushroom, true);
}

testMushroomDescriptionFromToJSON() {
  final Mushroom mushroom = mushroomsListMock[0];
  final Mushroom deserializedMushroom = Mushroom.fromJson(mushroom.toJson());
  expect(deserializedMushroom == mushroom, true);
}

testMushroomCopyWith() {
  final Mushroom helperMushroom = mushroomsListMock[1];
  final Mushroom mushroom = mushroomsListMock[0].copyWith(
    id: helperMushroom.id,
    name: helperMushroom.name,
    scientificName: helperMushroom.scientificName,
    tags: helperMushroom.tags,
  );

  expect(mushroom.id == helperMushroom.id, true);
  expect(mushroom.name == helperMushroom.name, true);
  expect(mushroom.scientificName == helperMushroom.scientificName, true);
  expect(mushroom.tags == helperMushroom.tags, true);
}

void main() {
  group('Mushroom Model', () {
    test('Mushroom model has mocked list', testMockedMushroomList);
    test('Mushroom copy with feature', testMushroomCopyWith);
    test('Tags to JSON and from JSON', testTagsFromAndToJSON);
    test('MushroomDescription from/to JSON', testMushroomDescriptionFromToJSON);
    test('Mushroom info from Firestore', testMushroomsFromFirestore);
  });
}
