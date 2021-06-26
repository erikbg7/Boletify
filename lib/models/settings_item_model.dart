import 'package:flutter/material.dart';

enum SettingsItemType { donate, rate, credits, privacy, terms, disclaimer, version }

class SettingsItem {
  final IconData icon;
  final String text;
  final Function onTap;

  SettingsItem({this.icon, this.text, this.onTap});
}