import 'package:flutter/material.dart';
import 'package:futter_project_tfg/config/settings_items_config.dart';
import 'package:futter_project_tfg/models/settings_item_model.dart';
import 'package:futter_project_tfg/screens/settings/credits/credits_screen.dart';

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
          context: context, title: 'Credits', screen: CreditsScreen()),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            SizedBox(width: 20),
            Icon(settings[item].icon),
            SizedBox(width: 20),
            Text(settings[item].text),
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
              SettingItem(item: SettingsItem.donate),
              SettingItem(item: SettingsItem.rate),
              SettingsSectionSplitter(),
              Text("Informació"),
              SettingItem(item: SettingsItem.credits),
              SettingItem(item: SettingsItem.privacy),
              SettingItem(item: SettingsItem.terms),
              SettingItem(item: SettingsItem.disclaimer),
              SettingsSectionSplitter(),
              Text('Versió Actual'),
              SettingItem(item: SettingsItem.version),
            ],
          ),
        ),
      ),
    );
  }
}
