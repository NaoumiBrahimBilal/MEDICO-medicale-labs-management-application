import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfViewerScreen extends StatefulWidget {
  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  late Future<List<Map<String, dynamic>>> _documents;

  @override
  void initState() {
    super.initState();
    _documents = MongoDatabase.fetchPdfDocuments();
  }

Future<File> downloadFile(String url, String fileName) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$fileName');
    await file.writeAsBytes(response.bodyBytes);
    return file;
  } else {
    throw Exception('Failed to download file');
  }
}

Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Downloadable PDFs')),
    body: FutureBuilder<List<Map<String, dynamic>>>(
      future: _documents,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error fetching documents');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final document = snapshot.data![index];
              return ListTile(
                title: Text(document['fileName']),
                  onTap: () async {
  final encodedPdfContent = document['pdfContent']; // Assuming this is Base64-encoded content
  final fileName = document['fileName'];

  if (encodedPdfContent!= null && fileName!= null) {
    // Manually ensure the Base64 string is correctly formatted
    String correctedEncodedPdfContent = encodedPdfContent.replaceAll('-', '+').replaceAll('_', '/');
    int mod = encodedPdfContent.length % 4;
    if (mod > 0) {
      correctedEncodedPdfContent += '=' * (4 - mod);
    }

    // Decode the corrected Base64 string to get the byte array
    List<int> pdfBytes = base64Decode(correctedEncodedPdfContent);

    // Get a temporary directory
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/$fileName');

    // Write the bytes to the file
    await file.writeAsBytes(pdfBytes);

    // Construct the full file path
    final fileUrl = 'file://${file.path}';

    // Attempt to launch the file
    if (await canLaunch(fileUrl)) {
      await launch(fileUrl);
    } else {
      throw 'Could not launch $fileUrl';
    }
  } else {
    // Handle the case where encodedPdfContent or fileName is null
    print('Either encodedPdfContent or fileName is null');
  }
},          
              );
            },
          );
        }
      },
    ),
  );
}
}