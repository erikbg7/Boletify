import 'package:flutter_test/flutter_test.dart';
import 'package:futter_project_tfg/config/settings_items_config.dart';
import 'package:futter_project_tfg/models/settings_item_model.dart';

void main() {
  test('Correct config for settings item config', (){
    expect(SettingsItemType.values.length, settingsMap.length);
    SettingsItemType.values.forEach((settingsItem) {
      expect(settingsMap[settingsItem] is SettingsItem, true);
    });
  });
}
