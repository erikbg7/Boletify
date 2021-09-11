import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/settings_model.dart';
import 'package:futter_project_tfg/screens/buttons/fetch_buttons_screen.dart';
import 'package:futter_project_tfg/screens/settings/credits/credits_screen.dart';
import 'package:futter_project_tfg/screens/settings/disclaimer/disclaimer_screen.dart';
import 'package:futter_project_tfg/screens/settings/privacy/privacy_screen.dart';

const SettingsItem donateSetting = SettingsItem(
  icon: Icons.card_giftcard,
  text: 'Fes una donació',
);

final SettingsItem rateSetting = SettingsItem(
    icon: Icons.star,
    text: "Qualifica l'applicació",
    redirectUrl:
        "https://play.google.com/store/apps/details?id=com.ebgapps.boletify");

final SettingsItem creditsSetting = SettingsItem(
  icon: Icons.info,
  text: "Credits",
  screen: CreditsScreen(),
);

final SettingsItem privacySetting = SettingsItem(
  icon: Icons.privacy_tip,
  text: "Privacitat",
  screen: PrivacyScreen(),
);

final SettingsItem termsSetting = SettingsItem(
  icon: Icons.my_library_books,
  text: "Termes d'us i legals",
  screen: CreditsScreen(),
);

final SettingsItem disclaimerSetting = SettingsItem(
  icon: Icons.warning,
  text: "Renuncia de responsabilitat",
  screen: CreditsScreen(),
);

final SettingsItem versionSetting = SettingsItem(
  icon: Icons.phone_android,
  text: "v0.0.0 (Beta)",
  screen: FetchButtonsScreen(),
);

SettingsItem itemFromSettings(Settings setting) {
  switch (setting) {
    case Settings.donate:
      return donateSetting;
    case Settings.rate:
      return rateSetting;
    case Settings.credits:
      return creditsSetting;
    case Settings.privacy:
      return privacySetting;
    case Settings.disclaimer:
      return disclaimerSetting;
    default:
      return versionSetting;
  }
}
