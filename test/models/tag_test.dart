import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/models/tag_model.dart';

void main() {
  group('Tag Model', () {
    test('Tags to JSON and from JSON', () {
      final List<Tag> tags = [Tag.winter, Tag.edible];
      final List<Tag> deserializedTags = tagsFromJson(tagsToJson(tags));
      tags.forEach((tag) => expect(deserializedTags.contains(tag), true));
    });
  });
}
