import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:last_1/others/firebase_storage_service.dart';

import 'mongo_service.dart';

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if(result!= null) {
  PlatformFile file = result.files.first;
  if (file.path!= null) {
    setState(() {
      _selectedFile = File(file.path??'');
    });
  } else {
   
  }
} else {
 
}
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null) return;

    var request = http.MultipartRequest('POST', Uri.parse('YOUR_UPLOAD_URL'));
    request.files.add(await http.MultipartFile.fromPath('file', _selectedFile!.path));
    var response = await request.send();

    if (response.statusCode == 200) {
      print('File uploaded successfully');
    } else {
      print('File upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload File'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Pick File'),
            ),
            if (_selectedFile!= null)
              ElevatedButton(
                onPressed: _uploadFile,
                child: Text('Upload File'),
              ),
          ],
        ),
      ),
    );
  }
 
void handleFileUpload(File file) async {
  
  String downloadUrl = await FirebaseStorageService().uploadFile(file);

  
  await MongoService().storeFileReference(downloadUrl);

  
}
}

