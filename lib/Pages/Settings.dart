import 'package:flutter/material.dart';
import 'package:bird_verifier/services/LocalStorageAccess.dart';
import 'package:bird_verifier/services/predictions_database.dart';
import 'package:bird_verifier/model/prediction.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:toggle_switch/toggle_switch.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();

}

class _SettingsPageState extends State<SettingsPage> {

  TextEditingController _textFieldController = TextEditingController();


  String? userMessage = "";


  int sendVerificationsToServerToggleIndex = 0;


  @override
  void dispose() {
    // Clean up the controller when the widget is dispose
    // passwordTextFieldController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    getSendVerificationsToServer();
  }


  void getSendVerificationsToServer() async{
    bool sendVerificationsToServer = await LocalStorageAccess.getSendVerificationsToServer();

    setState(() {
      if (sendVerificationsToServer){
        sendVerificationsToServerToggleIndex = 0;
      }else{
        sendVerificationsToServerToggleIndex = 1;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar( // https://www.youtube.com/watch?v=TczSxNJB1gU
        title: Text('Settings'),
        centerTitle: true,

      ),
      backgroundColor: Colors.lightGreen,
      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
              children: <Widget>[

                Text(
                  'When you are just testing you may not wish update the server.  '
                      'If that is the case, then set the following switch to NO '
                      '(the main screen will turn yellow to remind you).'
                      '\n',

                  textScaleFactor: 1.5,
                ),

                Text(
                  'Send verifications to server?',
                  textScaleFactor: 1.5,
                ),

                ToggleSwitch(

                  initialLabelIndex: sendVerificationsToServerToggleIndex,
                  totalSwitches: 2,
                  labels: ['Yes', 'No'],
                  radiusStyle: true,
                  onToggle: (index) {
                    // print('switched to: $index');
                    if(index==0){
                      setSendVerificationsToServer("true");
                    }else{
                      setSendVerificationsToServer("false");
                    }
                  },
                ),
                const Divider(
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),

                Text(
                  'Press the following button if you need to reset the stored username and password.',
                  textScaleFactor: 1.5,
                ),


                ElevatedButton(
                  style: style,
                  onPressed: resetCredentials,
                  child: const Text('Forget Username/Password'),
                ),

              ]
          ),
        ),

      ),
    );

  }



  void setUserMessage(String message){
    setState(() {
      userMessage = message;
    });
  }


  Future<void> resetCredentials() async {
    LocalStorageAccess.saveCacophonyPassword("empty");
    LocalStorageAccess.saveCacophonyUsername("empty");
  }

  void  setSendVerificationsToServer(String sendVerificationsToServer){
    print("sendVerificationsToServer $sendVerificationsToServer");
    LocalStorageAccess.setSendVerificationsToServer(sendVerificationsToServer);
  }






}