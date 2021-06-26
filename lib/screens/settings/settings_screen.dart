import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/settings_items_config.dart';
import 'package:futter_project_tfg/models/settings_item_model.dart';

void redirectTo({context: BuildContext, title: String, screen: Widget}) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('Búsqueda')), body: Container());
      },
    ),
  );
}

class SettingItem extends StatelessWidget {
  final SettingsItem item;
  const SettingItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => redirectTo(
          context: context, title: 'Credits', screen: Container()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(item.icon),
            SizedBox(width: 20),
            Text(item.text),
          ],
        ),
      ),
    );
  }
}

class SettingsSectionSplitter extends StatelessWidget {
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
        color: Colors.black38,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dona'ns Support"),
              SettingItem(item: settingsMap[SettingsItemType.donate]),
              SettingItem(item: settingsMap[SettingsItemType.rate]),
              SettingsSectionSplitter(),
              Text("Informació"),
              SettingItem(item: settingsMap[SettingsItemType.credits]),
              SettingItem(item: settingsMap[SettingsItemType.privacy]),
              SettingItem(item: settingsMap[SettingsItemType.terms]),
              SettingItem(item: settingsMap[SettingsItemType.disclaimer]),
              SettingsSectionSplitter(),
              Text('Versió Actual'),
              SettingItem(item: settingsMap[SettingsItemType.version]),
            ],
          ),
        ),
      ),
    );
  }
}
