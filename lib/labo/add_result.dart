



/*
// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:path_provider/path_provider.dart';
class AnalysisResult {
 final String id;
 final String analysisName;
 final String value;

 AnalysisResult({required this.id, required this.analysisName, required this.value});

 // Convertir l'objet en Map pour faciliter la sauvegarde dans MongoDB
 Map<String, dynamic> toMap() {
    return {
      'id': id,
      'analysisName': analysisName,
      'value': value,
    };
 }
}

class AddAnalysisResultPage extends StatefulWidget {
  final String elementId;

  AddAnalysisResultPage({required this.elementId});

  @override
  _AddAnalysisResultPageState createState() => _AddAnalysisResultPageState();
}

class _AddAnalysisResultPageState extends State<AddAnalysisResultPage> {
  final _formKey = GlobalKey<FormState>();
  int _numberOfAnalyses = 0;
  List<Map<String, String>> _analysisResults = [];
  final TextEditingController _searchController=TextEditingController();
  List<Map<String,dynamic>>_users=[];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter des résultats d\'analyse', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue, // Medical theme color
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed:(){
              _performSearch(context);

            }
            ),
         // ),
        /*²  IconButton(
            icon: Icon(Icons.save, color: Colors.white),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Ici, vous pouvez ajouter le code pour sauvegarder les données dans MongoDB
              }
            },
          ),*/
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nombre d\'analyses',
                  labelStyle: TextStyle(color: Colors.blue), // Medical theme color
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue), // Medical theme color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent), // Medical theme color
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value!= null && value.isNotEmpty) {
                    if (int.tryParse(value)!= null) {
                      setState(() {
                        _numberOfAnalyses = int.parse(value);
                        _analysisResults = List.generate(_numberOfAnalyses, (index) => {'name': '', 'value': ''});
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Veuillez entrer un nombre valide.')),
                      );
                    }
                  } else {
                    setState(() {
                      _numberOfAnalyses = 0;
                      _analysisResults = [];
                    });
                  }
                },
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _analysisResults.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nom de l\'analyse ${index + 1}',
                            labelStyle: TextStyle(color: Colors.blue), // Medical theme color
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue), // Medical theme color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent), // Medical theme color
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _analysisResults[index]['name'] = value;
                            });
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Valeur de l\'analyse ${index + 1}',
                            labelStyle: TextStyle(color: Colors.blue), // Medical theme color
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue), // Medical theme color
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueAccent), // Medical theme color
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _analysisResults[index]['value'] = value;
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: ()async {
                   FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    if (result!= null) {
      PlatformFile file = result.files.first;
      String base64Pdf = await readPdfFileAsBase64(file.name);
      await MongoDatabase.insertPdfDocument('finance', file.name!, base64Pdf);
                  }
                },
                child: Text('Ajouter', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
//

Future<String> readPdfFileAsBase64(String fileName) async {
  // Get the directory where the file is stored
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String filePath = '${appDocDir.path}/$fileName';

  // Read the file as bytes
  File file = File(filePath);
  Uint8List bytes = await file.readAsBytes();

  // Encode the bytes to a Base64 string
  String base64String = base64Encode(bytes);

  return base64String;
}
Future<void> _performSearch(BuildContext context) async {
  String searchTerm = _searchController.text;
  if (searchTerm.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Entrez un terme de recherche.')));
    return;
  }

  try {
    List<Map<String, dynamic>> users = await MongoDatabase.searchUsers(searchTerm);
    setState(() {
      _users = users;
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erreur lors de la recherche : $e')));
  }
}

}*/
