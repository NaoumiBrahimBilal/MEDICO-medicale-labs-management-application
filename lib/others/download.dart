import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

Future<void> downloadFile(String url, String fileName) async {
  // Get the directory to save the file
  Directory appDocDir = await getApplicationDocumentsDirectory();
  File tempFile = File('${appDocDir.path}/$fileName');

  // Send a GET request
  var response = await http.get(Uri.parse(url));

  // Write the response body to a file
  await tempFile.writeAsBytes(response.bodyBytes);

  print('File downloaded successfully');
}