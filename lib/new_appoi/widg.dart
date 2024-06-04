//import 'package:date_picker_dialog/date_picker_dialog.dart';
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:last_1/dbhelper/constant.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/new_appoi/app_class.dart';
import 'package:uuid/uuid.dart';
//import 'package:time_picker_dialog/time_picker_dialog.dart';

Future<DateTime?> pickDateAndTime(BuildContext context) async {
  DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2100),
  );

  if (pickedDate!= null) {
    TimeOfDay? pickedHour = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    if (pickedHour!= null) {
      return DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedHour.hour);
    }
}

  return null;
}
/*Future<void> storeBooking(String id, DateTime dateTime) async {
  var client = await MongoDatabase.connect(MONGO_CONN_URL);
  
  var db = client.db('db'); 

  var collection = db.collection('appointments');

  var booking = Booking(id: id, date: dateTime, hour: TimeOfDay.fromDateTime(dateTime));
  await collection.insertOne(booking.toJson());
  var uuid = Uuid();
String iid = uuid.v4(); 
await storeBooking(iid, dateTime);
}*/


/*Future<void> storeBooking(String id, DateTime dateTime) async {
  // Connect to MongoDB
  //var client = await MongoDatabase.connect(MONGO_CONN_URL);

  // Select the database and collection
  //var db = client.db('db');
  var collection = db.collection('appointments');

  // Convert DateTime to ISO 8601 string for storage
  String dateTimeStr = dateTime.toIso8601String();

  // Create a document to insert
  var document = {
    '_id': id,
    'dateTime': dateTimeStr,
   // 'hour':hou
    // Add any other fields you need to store
  };

  // Insert the document into the collection
  await collection.insertOne(document);

  // Optionally, generate a new UUID and recursively call storeBooking
  var uuid = Uuid();
  String newId = uuid.v4();
  await storeBooking(newId, dateTime);
}*/
