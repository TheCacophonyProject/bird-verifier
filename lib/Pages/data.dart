import 'package:flutter/material.dart';
import 'package:bird_verifier/services/LocalStorageAccess.dart';
import 'package:bird_verifier/services/predictions_database.dart';
import 'package:bird_verifier/model/prediction.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();


}

class _DataPageState extends State<DataPage> {

  TextEditingController _textFieldController = TextEditingController();


  String? userMessage = "";

  int numberOfRecordingsOnPhone = 0;
  int diskSpaceUsedBySavedRecordings = 0;


  final passwordTextFieldController = TextEditingController(); // https://flutter.dev/docs/cookbook/forms/retrieve-input




  @override
  void dispose() {
    // Clean up the controller when the widget is dispose
   // passwordTextFieldController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();

    getDiskSpaceUsedBySavedRecordings();
  }



  void getDiskSpaceUsedBySavedRecordings() async{
    // https://stackoverflow.com/questions/57140112/how-to-get-the-size-of-a-directory-including-its-files

    int countRecordings = 0;
    int totalSize = 0;
    final directory = await LocalStorageAccess.getLocalRecordingsDirectory();
    try {
      if (directory.existsSync()) {
        directory.listSync(recursive: true, followLinks: false)
            .forEach((FileSystemEntity entity) {
          if (entity is File) {
            countRecordings++;
            totalSize += entity.lengthSync();
          }
        });
      }


      setState(() {
              numberOfRecordingsOnPhone = countRecordings;
              diskSpaceUsedBySavedRecordings = totalSize~/100000.0;

            });

    } catch (e) {
      print(e.toString());
    }

  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar( // https://www.youtube.com/watch?v=TczSxNJB1gU
        title: Text('Data'),
        centerTitle: true,

      ),
      backgroundColor: Colors.green,
      body: SafeArea(

        child: ListView(
            children: <Widget>[

              Text(
                'Number of recordings on phone: $numberOfRecordingsOnPhone',
                textScaleFactor: 1.5,
              ),

              Text(
                'Disk space used by recordings on phone: $diskSpaceUsedBySavedRecordings MB',
                textScaleFactor: 1.5,
              ),

            ]
        ),

      ),
    );

  }





  void setUserMessage(String message){
    setState(() {
      userMessage = message;
    });
  }




  void locallyStoredPredictions() async {

    List<Prediction> allPredictions = await PredictionsDatabase.instance.readAllPredictions();

    for (var i = 0; i < allPredictions.length; i++) {
      Prediction prediction = allPredictions[i];
      print(prediction.species);

      print('species is ${prediction.species}, begin_s is ${prediction.begin_s}, end_s is ${prediction.end_s}, liklihood is ${prediction.liklihood}');


    }

  }


















}