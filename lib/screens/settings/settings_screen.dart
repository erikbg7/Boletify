import 'package:flutter/material.dart';
import 'package:futter_project_tfg/colors.dart';
import 'package:futter_project_tfg/config/settings_config.dart';
import 'package:futter_project_tfg/theme.dart';
import 'package:futter_project_tfg/utils/utils.dart';
import 'package:futter_project_tfg/models/settings_model.dart';
import 'package:futter_project_tfg/widgets/gradient_full_screen.dart';

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
            Icon(item.icon),
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
        color: BoletifyColors.sectionSplitter.withOpacity(0.5),
        margin: EdgeInsets.symmetric(vertical: 10));
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Opcions", style: TextStyle(fontSize: 22),))),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            gradient: buildFullScreenBackground(Colors.greenAccent)),
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsSplitter(),
              Text("Dona'ns Support", style: TextStyles.settingsSectionTitle),
              SettingItem(item: itemFromSettings(Settings.donate)),
              SettingItem(item: itemFromSettings(Settings.rate)),
              SettingsSplitter(),
              Text("Informació", style: TextStyles.settingsSectionTitle),
              SettingItem(item: itemFromSettings(Settings.credits)),
              SettingItem(item: itemFromSettings(Settings.privacy)),
              SettingItem(item: itemFromSettings(Settings.terms)),
              SettingItem(item: itemFromSettings(Settings.disclaimer)),
              SettingsSplitter(),
              Text('Versió Actual', style: TextStyles.settingsSectionTitle),
              SettingItem(item: itemFromSettings(Settings.version)),
            ],
          ),
        ),
      ),
    );
  }
}
