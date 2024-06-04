// Create a new file: lib/labo/personnel_detail_page.dart

import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; // Adjust the import path as necessary

class PersonnelDetailPage extends StatelessWidget {
  final String personnelId;

  PersonnelDetailPage({required this.personnelId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personnel Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: MongoDatabase.fetchPersonnelDetails(personnelId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var personnel = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${personnel['firstname']}'),
                  Text('Last Name: ${personnel['lastname']}'),
                  Text('email: ${personnel['email']}'),
                 // Text('Role: ${personnel['role']}'),
                  //Text('Salary: ${personnel['salary']}'),
                 // Text('Absences: ${personnel['absences']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}