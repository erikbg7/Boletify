import 'dart:io';

Map<String, String> labelsMap = {
  '0 amanita': 'Amanita Muscaria',
  '1 mushroom': 'Champinyó Comú'
};

class ClassifierOutput {
  final double confidence;
  final String label;
  final File image;

  ClassifierOutput(this.confidence, this.label, this.image);

  String get confidencePercentage => (this.confidence * 100).toStringAsFixed(2);

  factory ClassifierOutput.fromTFLite(List<dynamic> data, File image) {
    final output = data.first;
    final confidence = double.parse('${output["confidence"]}');
    final label = labelsMap[output["label"]] ?? 'Unknown';
    return ClassifierOutput(confidence, label, image);
  }
}
