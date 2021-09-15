import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/classifier_config.dart';
import 'package:futter_project_tfg/config/mushroom_mock_config.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';
import 'package:futter_project_tfg/models/mushroom_model.dart';
import 'package:futter_project_tfg/models/tag_model.dart';

testTagsFromAndToJSON() {
  final List<Tag> tags = [Tag.winter, Tag.edible];
  final List<Tag> deserializedTags = tagsFromJson(tagsToJson(tags));
  tags.forEach((tag) => expect(deserializedTags.contains(tag), true));
}

testOutputFromTFLite() {
  final double confidence = 0.9;
  final String label = mushroomIdByLabelMap.keys.first;
  final File image = new File('imageurl');

  Map<String, dynamic> tfresult = {'confidence': confidence, 'label': label};
  List<dynamic> data = [tfresult].toList();

  ClassifierOutput output = ClassifierOutput.fromTFLite(data, image);

  expect(output.confidence == confidence, true);
  expect(output.label == mushroomIdByLabelMap[label], true);
  expect(output.image == image, true);
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
  final Mushroom deserializedMushroom =
      Mushroom.fromJson(mushroom.toJson());
  expect(deserializedMushroom == mushroom, true);
}

void main() {
  test('Mushroom model has mocked list', testMockedMushroomList);
  test('Tags to JSON and from JSON', testTagsFromAndToJSON);
  test('ClassifierOutput from TFLite', testOutputFromTFLite);
  test('MushroomDescription from/to JSON', testMushroomDescriptionFromToJSON);
  test('Mushroom info from Firestore', testMushroomsFromFirestore);
}
