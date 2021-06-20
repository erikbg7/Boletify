import 'package:flutter/material.dart';
import 'package:futter_project_tfg/models/settings_item_model.dart';

Map<SettingsItem, SettingsItemInfo> settings = {
  SettingsItem.donate: SettingsItemInfo(
    icon: Icons.card_giftcard,
    text: 'Fes una donació',
  ),
  SettingsItem.rate: SettingsItemInfo(
    icon: Icons.star,
    text: "Qualifica l'applicació",
  ),
  SettingsItem.credits: SettingsItemInfo(
    icon: Icons.info,
    text: "Credits",
  ),
  SettingsItem.privacy: SettingsItemInfo(
    icon: Icons.privacy_tip,
    text: "Privacitat",
  ),
  SettingsItem.terms: SettingsItemInfo(
    icon: Icons.my_library_books,
    text: "Termes d'us i legals",
  ),
  SettingsItem.disclaimer: SettingsItemInfo(
    icon: Icons.warning,
    text: "Renuncia de responsabilitat",
  ),
  SettingsItem.version: SettingsItemInfo(
    icon: Icons.phone_android,
    text: "v0.0.0 (Beta)",
  ),
};