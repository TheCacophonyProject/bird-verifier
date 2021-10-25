import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));


  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(

      title: Text('About'),
      centerTitle: true,
      backgroundColor: Colors.green,
    ),
    backgroundColor: Colors.lightGreen,
    body : SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
            children: <Widget>[
              Text(

                'The Cacophony Project\'s audio machine learning model analyses each audio'
                    ' recording that is uploaded from Bird Monitors. '
                    '\n'
                    '\n'
                    'The model predicts the presence or otherwise of specific bird species'
                    ' (currently just Morepork/Ruru) in a sliding 3 second window'
                    ' across each minute recording.'
                    '\n'
                    '\n'
                    'The Bird Verifier app allows users to:'
                    '\n'
                    '\n'
                    '1) Listen to just those 3 second windows,'
                    '\n'
                    '2) Press a button to indicate if they agree or otherwise with the model,'
                    '\n'
                    '3) Immediately upload this feedback to The Cacophony server'
                    ' - as a tag against the recording: this will provide valuable'
                    ' data for further improvements to the model.'
                    '\n',
                textScaleFactor: 1.5,
              ),



              Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: "https://cacophony.org.nz",
                // style: TextStyle(color: Colors.yellow),
                linkStyle: TextStyle(color: Colors.red),
              )

        ],



        ),
      ),
    ),
  );





}



