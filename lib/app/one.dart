/*import 'package:flutter/material.dart';
import 'package:last_1/app/display_app.dart';
import 'package:last_1/dbhelper/constant.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:mongo_dart/mongo_dart.dart' ;

class AppointmentsPage extends StatelessWidget {
  final List<Appointment> appointments;

  const AppointmentsPage({Key? key, required this.appointments}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Appointments')),

      body: 
      ElevatedButton(
  onPressed: () async {
   
    final appointments = await fetchAppointments();
    
    // Navigate to a page that displays the appointments
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppointmentsPage(appointments: appointments),
      ),
    );
  },
  child: Text('Show Appointments'),
),
      
    );
  }
}
class Appointment {
  final String id;
  final String date;
  final int hour;
  final String status;

  Appointment({required this.id, required this.date, required this.hour, required this.status});

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['_id'],
      date: map['date'],
      hour: map['hour'],
      status: map['status'],
    );
  }
}


Future<List<Appointment>> fetchAppointments() async {
  final mongoUri = MONGO_CONN_URL;
  var db;
 // final dbName = "db";
  final collectionName = "appointments";

  try {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    final client = await MongoDatabase.connect(mongoUri);
    if (client == null) {
      print("Failed to connect to MongoDB.");
      return []; // Return an empty list or handle the failure appropriately
    }

   // final db = client.db(dbName);
  //  await db.open();
    final collection = db.collection(collectionName);

    final appointmentsDocs = await collection.find().toList();
    await db.close();

    return appointmentsDocs.map((doc) => Appointment.fromMap(doc)).toList();
  } catch (e) {
    print("Error fetching appointments: $e");
    return []; // Return an empty list or handle the failure appropriately
  }
}
*/