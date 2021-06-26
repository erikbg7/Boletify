import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/mushroom_labels_config.dart';
import 'package:futter_project_tfg/config/settings_items_config.dart';
import 'package:futter_project_tfg/models/mushroom_label_model.dart';
import 'package:futter_project_tfg/models/settings_item_model.dart';

void main() {
  test('Correct config for mushroom labels', (){
    expect(SearchLabels.values.length, mushroomLabels.length);
    SearchLabels.values.forEach((label) {
      expect(mushroomLabels[label] is MushroomLabel, true);
    });
  });
  test('Correct config for settings item config', (){
    expect(SettingsItem.values.length, settings.length);
    SettingsItem.values.forEach((settingsItem) {
      expect(settings[settingsItem] is SettingsItemInfo, true);
    });
  });
}
