import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/settings_item_model.dart';

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
  ),
  SettingsItemType.privacy: SettingsItem(
    icon: Icons.privacy_tip,
    text: "Privacitat",
  ),
  SettingsItemType.terms: SettingsItem(
    icon: Icons.my_library_books,
    text: "Termes d'us i legals",
  ),
  SettingsItemType.disclaimer: SettingsItem(
    icon: Icons.warning,
    text: "Renuncia de responsabilitat",
  ),
  SettingsItemType.version: SettingsItem(
    icon: Icons.phone_android,
    text: "v0.0.0 (Beta)",
  ),
};