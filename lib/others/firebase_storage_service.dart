// firebase_storage_service.dart
// ignore_for_file: unused_import

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;

class FirebaseStorageService {
  Future<String> uploadFile(File file) async {
    // Generate a unique file name
    String fileName = '${DateTime.now().millisecondsSinceEpoch}.pdf';

    // Create a reference to the file you want to upload
    Reference ref = FirebaseStorage.instance.ref().child(fileName);

    // Upload the file
    UploadTask uploadTask = ref.putFile(file);

    // Wait for the upload to complete
    await uploadTask;

    // Get the download URL of the uploaded file
    String downloadUrl = await ref.getDownloadURL();

    return downloadUrl;
  }
}