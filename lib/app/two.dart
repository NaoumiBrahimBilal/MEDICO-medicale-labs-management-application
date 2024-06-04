/*// Flutter code to display available appointments
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
//import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:last_1/dbhelper/constant.dart';
//import 'package:mongo_dart/mongo_dart.dart'asM ;

import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class BookingScreen extends StatefulWidget {
  final credential =FirebaseAuth.instance;
  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime? _selectedDate;
  int? _selectedHour;

  Future<void> _pickDate(BuildContext context) async {
    DateTime? pickedDate = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2100),
     // initialTime: TimeOfDay(hour: 9, minute: 0),
      //dateFormat: 'yyyy-MM-dd – kk:mm',
      locale: LocaleType.en,
    );
    if (pickedDate!= null) {
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(pickedDate);
    print(formattedDate); // Or use the formatted date as needed
  }
    setState(() {
      _selectedDate = pickedDate!;
    });
  }

 /* Future<void> _pickHour(BuildContext context) async {
    int? pickedHour = await showTimePicker(
     context: context c,
      initialTime: TimeOfDay(hour: 9, minute: 0),
      backgroundColor: Colors.blueAccent,
      okColor: Colors.green,
      cancelColor: Colors.grey,
      showSeconds: false,
      animateFromIcon: AnimatedIcons.add_event,
      onChanged: (pickedHour) {},
    );
    setState(() {
      _selectedHour = pickedHour!;
    });
  }
*/
Future<void> _pickHour(BuildContext context) async {
  TimeOfDay? pickedHour = await showTimePicker(
    context: context,
    initialTime: TimeOfDay(hour: 9, minute: 0),
  );
  if (pickedHour!= null) {
    int selectedHour = pickedHour.hour;
    setState(() {
      _selectedHour = selectedHour;
    });
  }
}
  Future<void> _bookAppointment(String userId) async {
    var uri = "mongodb+srv://user_1:q1pVgRI7PnHGKM41@clus.mowkx0r.mongodb.net/db?retryWrites=true&w=majority&appName=clus"; // Replace with your MongoDB URI
    var db = await M.Db.create(uri);
    await db.open();
    try {
      var collection = db.collection('appointments');
      var document = {
        'id': '',
        '_id': userId,
        'date': _selectedDate!.toIso8601String(),
        'hour': _selectedHour!,
        'status': 'booked'
      };
      await collection.insertOne(document);
      // Handle success
    } catch (e) {
      print('Error booking appointment: $e');
    } finally {
      await db.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Appointment')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _pickDate(context),
              child: Text('Pick Date'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickHour(context),
              child: Text('Pick Hour'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              
              onPressed: () {
                final credential =FirebaseAuth.instance;
                _bookAppointment(credential.currentUser!.uid);
              } , // Replace 'user123' with actual user ID
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}*/