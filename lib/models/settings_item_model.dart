import 'package:flutter/material.dart';

enum SettingsItem { donate, rate, credits, privacy, terms, disclaimer, version }

class SettingsItemInfo {
  final IconData icon;
  final String text;
  final Function onTap;

  SettingsItemInfo({this.icon, this.text, this.onTap});
}