// ignore_for_file: unused_import

/*import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/new_appoi/dis_app/dis.dart';
// Import your database helper

class LAppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<LAppointmentsPage> {
  //late Future<List<LAppointment>> futureAppointments;
  Future<List<LAppointment>>? futureAppointments;

 //Future<List<LAppointment>>? futureAppointments;

@override
void initState() {
  super.initState();
  futureAppointments = MongoDatabase.instance.fetchAppointmentsWithPatientNames()
     .then((appointments) {
    List<LAppointment> lAppointments = appointments.map((appointment) {
      Map<String, dynamic> appointmentMap = appointment.toJson();
      return LAppointment.fromJson(appointmentMap);
    }).toList();
    return Future.value(lAppointments);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: FutureBuilder<List<LAppointment>>(
  future: futureAppointments?? Future.value([]),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    } else if (snapshot.hasData && snapshot.data!= null) {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          var appointment = snapshot.data![index];
          return ListTile(
            title: Text(' Patient Name: ${appointment.dateTime?? ''}'), // Safeguard against null
            subtitle: Text(appointment.status?? ''), // Safeguard against null
          );
        },
      );
    }
    return Container(); // Fallback in case none of the above conditions are met
  },
),
    );
  }
}
/*class Appointment {
  final String id;
  final String dateTime;

  Appointment({required this.id, required this.dateTime});

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      dateTime: json['dateTime'],
    );
  }
}
*/
class LAppointment {
  final String id;
  final String dateTime;
  final String status;

  LAppointment({
    required this.id,
    required this.dateTime,
    required this.status,
  });

  factory LAppointment.fromJson(Map<String, dynamic> json) {
    return LAppointment(
      id: json['_id'],
      dateTime: json['dateTime'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'dateTime': dateTime,
      'status': status,
    };}
}*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:last_1/new_appoi/widg.dart';
import 'package:last_1/dbhelper/mongo.dart';

class MyWidgett extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidgett> {

  List<Map<String, dynamic>>? _documents;

  @override
  void initState() {
    super.initState();
    _loadAllDocuments();
  }

  Future<void> _loadAllDocuments() async {
    final documents = await MongoDatabase.fetchAllDocuments();
    setState(() {
      _documents = documents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('booked appointments'),
      ),
      body: Center(
        child: Column(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
           // SizedBox(height: 20),
            if (_documents!= null)
              Expanded(
                child: ListView.builder(
                  itemCount: _documents!.length,
                  itemBuilder: (context, index) {
                    final document = _documents![index];
                    
                    return ListTile(
                      title: Text(document['dateTime']?? 'Title Not Available'),
                      subtitle: Text(document['status']?? 'Content Not Available'),
                      
                    );
                  },
                ),
              ),
               ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/appointments');
              },
              child: Text('book your appointment now'),
            ),
          ],
        ),
      ),
    );
  }
}