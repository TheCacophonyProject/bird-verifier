import 'package:flutter/material.dart';
import 'package:bird_verifier/services/LocalStorageAccess.dart';

class SettingsPage extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Settings'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
body : SafeArea(
      child: ListView(
      children: <Widget>[

        ElevatedButton(
          style: style,
          onPressed: resetCredentials,
          child: const Text('Forget Username/Password'),
        ),

    Text(
    'boooooooooo',
    textScaleFactor: 1.5,
  ),

  Text(
  'boooooooooo',
  textScaleFactor: 1.5,
  ),

  ]

),
  ),
  );


  Future<void> resetCredentials() async {
    LocalStorageAccess.saveCacophonyPassword("empty");
    LocalStorageAccess.saveCacophonyUsername("empty");
  }


}



