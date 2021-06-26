import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/settings_item_model.dart';
import 'package:futter_project_tfg/screens/settings/credits/credits_screen.dart';

Map<SettingsItemType, SettingsItem> settingsMap = {
  SettingsItemType.donate: SettingsItem(
    icon: Icons.card_giftcard,
    text: 'Fes una donació',
  ),
  SettingsItemType.rate: SettingsItem(
    icon: Icons.star,
    text: "Qualifica l'applicació",
  ),
  SettingsItemType.credits: SettingsItem(
    icon: Icons.info,
    text: "Credits",
    screen: CreditsScreen(),
  ),
  SettingsItemType.privacy: SettingsItem(
    icon: Icons.privacy_tip,
    text: "Privacitat",
    screen: CreditsScreen(),
  ),
  SettingsItemType.terms: SettingsItem(
    icon: Icons.my_library_books,
    text: "Termes d'us i legals",
    screen: CreditsScreen(),
  ),
  SettingsItemType.disclaimer: SettingsItem(
    icon: Icons.warning,
    text: "Renuncia de responsabilitat",
    screen: CreditsScreen(),
  ),
  SettingsItemType.version: SettingsItem(
    icon: Icons.phone_android,
    text: "v0.0.0 (Beta)",
  ),
};