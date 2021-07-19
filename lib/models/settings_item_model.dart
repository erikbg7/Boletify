import 'package:flutter/material.dart';

enum SettingsItemType {
  donate,
  rate,
  credits,
  privacy,
  terms,
  disclaimer,
  version
}

class SettingsItem {
  final IconData icon;
  final String text;
  final Widget? screen;

  SettingsItem({
    required this.icon,
    required this.text,
    this.screen,
  });
}