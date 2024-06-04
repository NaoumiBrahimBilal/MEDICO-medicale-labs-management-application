/*import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerWidget extends StatelessWidget {
  final Uint8List document;

  PdfViewerWidget({required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(document: document),
    );
  }
}
*/
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class pdff extends StatelessWidget {
  final String patientId;
 

  const pdff({Key? key, required this.patientId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final credential=FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultat'),
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
                  'Telecharger Votre Resultats',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 20),
                /*ElevatedButton.icon(
                  onPressed: () async {
                    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.any);
                    if (result != null) {
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
                ),*/
                SizedBox(height: 20),
                ElevatedButton.icon(
                  
                  onPressed: () async {
                   var document = await MongoDatabase.fetchPdfDocument(credential.currentUser!.uid, 'result');
                    if (document != null) {
                      String fileName = document['fileName'];
                      String base64Pdf = document['pdfContent'];
                      String filePath = await savePdfFile(fileName, base64Pdf);
                      print('PDF downloaded successfully');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('File saved to $filePath')),
                      );
                      await openFile(filePath);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('aucun resultats pour vous')),
                      );

                      print('No document found for patient ID: $patientId');
                    }
                  },
                  icon: Icon(Icons.download, color: Colors.white),
                  label: Text('Download PDF'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(113, 26, 226, 159),
                   
                  ),
                ),
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

  Future<String> savePdfFile(String fileName, String base64Content) async {
    Uint8List bytes = base64Decode(base64Content);
    Directory tempDir = await getTemporaryDirectory();
    String filePath = '${tempDir.path}/$fileName';
    File file = File(filePath);
    await file.writeAsBytes(bytes);
    print('File saved to $filePath');
    return filePath;
    
  }
  Future<void> openFile(String filePath) async {
    final result = await OpenFilex.open(filePath);
    print(result.message);
  }
}
