
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_1/new_appoi/widg.dart';
import 'package:last_1/dbhelper/mongo.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
 
  DateTime? _selectedDateTime;

  void _handleSelectDateTime() async {
    final pickedDateTime = await pickDateAndTime(context);
    setState(() {
      _selectedDateTime = pickedDateTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date & Time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _handleSelectDateTime,
              child: Text('Pick Date and Time'),
            ),
            SizedBox(height: 20),
            if (_selectedDateTime!= null)
              Text('Selected Date and Time: $_selectedDateTime'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_selectedDateTime!= null) {
                   final credential =FirebaseAuth.instance;
                 MongoDatabase.instance.storeBooking( credential.currentUser!.uid, _selectedDateTime!); // Replace 'uniqueId' with actual ID generation logic
                  print('Data stored successfully');
                } else {
                  print('Please select a date and time.');
                }
              },
              child: Text('Store Data'),
            ),
          ],
        ),
      ),
    );
  }
}