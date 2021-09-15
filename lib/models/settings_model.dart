import 'package:flutter/material.dart';

enum Settings { donate, rate, credits, privacy, terms, disclaimer, version }

class SettingsItem {
  final IconData icon;
  final String text;
  final Widget? screen;
  final String? redirectUrl;

  const SettingsItem({
    required this.icon,
    required this.text,
    this.screen,
    this.redirectUrl,
  });
}
