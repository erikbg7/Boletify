import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;

  const SettingsItem({Key key, this.icon, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(width: 20),
          Icon(icon),
          SizedBox(width: 20),
          Text(text),
        ],
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
      appBar: AppBar(
        title: Text("Opcions"),
      ),
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
              SettingsItem(icon: Icons.card_giftcard, text: 'Fes una donació'),
              SettingsItem(icon: Icons.star, text: "Qualifica l'applicació"),
              SettingsSectionSplitter(),
              Text("Informació"),
              SettingsItem(icon: Icons.info, text: "Credits"),
              SettingsItem(icon: Icons.privacy_tip, text: "Privacitat"),
              SettingsItem(icon: Icons.my_library_books, text: "Termes d'us i legals"),
              SettingsItem(icon: Icons.warning, text: "Renuncia de responsabilitat"),
              SettingsSectionSplitter(),
              Text('Versió Actual'),
              SettingsItem(icon: Icons.phone_android, text: "v0.0.0 (Beta)"),
            ],
          ),
        ),
      ),
    );
  }
}
