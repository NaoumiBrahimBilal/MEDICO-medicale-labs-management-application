// ignore_for_file: prefer_const_constructors, unused_import

/*
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:file_picker/file_picker.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:path_provider/path_provider.dart';
 String imageBase64String = '';

class ResultScreen extends StatelessWidget {
  final String patientId;

  ResultScreen({required this.patientId});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Analysis Results:$patientId'),
        ),
        body: flutter.Center(
          child: 
          ElevatedButton(
  onPressed: () async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);

    if (result!= null) {
      PlatformFile file = result.files.first;
      String base64Pdf = await readPdfFileAsBase64(file.path!);
     
      await MongoDatabase.insertPdfDocument(patientId, 'result',file.name, base64Pdf);
    
      print('PDF uploaded successfully');
    } else {
      
      print('No file selected.');
    }
  },
  child: Text('Upload PDF'),
),
        ),
      ),
    );
  }

Future<String> readPdfFileAsBase64(String filePath) async {
  File file = File(filePath);
  Uint8List bytes = await file.readAsBytes();
  String base64String = base64Encode(bytes);
  return base64String;
}
}*/
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:path_provider/path_provider.dart';

class ResultScreen extends StatelessWidget {
  final String patientId;

  const ResultScreen({Key? key, required this.patientId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analysis Results: '),
        backgroundColor: Color.fromARGB(113, 26, 226, 159), // Customizing the app bar background color
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload Analysis Report',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
                    if (result!= null) {
                      PlatformFile file = result.files.first;
                      String base64Pdf = await readPdfFileAsBase64(file.path!);
                      await MongoDatabase.insertPdfDocument(patientId, 'result', file.name, base64Pdf);
                      print('PDF uploaded successfully');
                    } else {
                      print('No file selected.');
                    }
                  },
                  icon: Icon(Icons.upload_file, color: Colors.white),
                  label: Text('Upload PDF'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(113, 26, 226, 159),
                   // minimumSize: Size(200, 50),
                  ),
                ),
                SizedBox(height: 20),
                
                SizedBox(height: 20),
              
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<String> readPdfFileAsBase64(String filePath) async {
    File file = File(filePath);
    Uint8List bytes = await file.readAsBytes();
    String base64String = base64Encode(bytes);
    return base64String;
  }
}