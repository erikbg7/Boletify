import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/classifier_config.dart';
import 'package:futter_project_tfg/models/classifier_output_model.dart';

void main() {
  group('Classifier Model', () {
    test('ClassifierOutput from TFLite', () {
      final double confidence = 0.9;
      final String label = mushroomIdByLabelMap.keys.first;
      final File image = new File('imageurl');

      Map<String, dynamic> tfresult = {
        'confidence': confidence,
        'label': label
      };
      List<dynamic> data = [tfresult].toList();

      ClassifierOutput output = ClassifierOutput.fromTFLite(data, image);

      expect(output.confidence == confidence, true);
      expect(output.label == mushroomIdByLabelMap[label], true);
      expect(output.image == image, true);
    });
  });
}
