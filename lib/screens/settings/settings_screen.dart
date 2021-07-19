import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/settings_items_config.dart';
import 'package:futter_project_tfg/models/settings_item_model.dart';
import 'package:futter_project_tfg/utils/utils.dart';

void handleSettingsItemTap(BuildContext context, SettingsItem item) {
  if (item.screen is Widget) {
    redirectTo(context: context, screen: item.screen);
  }
}

class SettingItem extends StatelessWidget {
  final SettingsItem item;
  const SettingItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => handleSettingsItemTap(context, item),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(item.icon, color: Colors.greenAccent),
            SizedBox(width: 20),
            Text(item.text),
          ],
        ),
      ),
    );
  }
}

class SettingsSplitter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 2,
        color: Colors.white30,
        margin: EdgeInsets.symmetric(vertical: 10));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Opcions")),
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dona'ns Support"),
              SettingItem(item: settingsMap[SettingsItemType.donate]!),
              SettingItem(item: settingsMap[SettingsItemType.rate]!),
              SettingsSplitter(),
              Text("Informació"),
              SettingItem(item: settingsMap[SettingsItemType.credits]!),
              SettingItem(item: settingsMap[SettingsItemType.privacy]!),
              SettingItem(item: settingsMap[SettingsItemType.terms]!),
              SettingItem(item: settingsMap[SettingsItemType.disclaimer]!),
              SettingsSplitter(),
              Text('Versió Actual'),
              SettingItem(item: settingsMap[SettingsItemType.version]!),
            ],
          ),
        ),
      ),
    );
  }
}
