import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; // Import your MongoDatabase class

class LabsPage extends StatefulWidget {
  @override
  _LabsPageState createState() => _LabsPageState();
}

class _LabsPageState extends State<LabsPage> {
  late Future<List<Map<String, dynamic>>> _labsdocuments;

  @override
  void initState() {
    super.initState();
    _labsdocuments = MongoDatabase.fetchlabsDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lab\'s list '),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _labsdocuments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var document = snapshot.data![index];
                return ListTile(
                  title: Text('${document['firstname']} ${document['lastname']}'),
                  subtitle: Text(' email:${document['email']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}