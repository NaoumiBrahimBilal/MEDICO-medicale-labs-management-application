/*import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
// Import your database helper

class AppointmentsPage extends StatefulWidget {
  @override
  _AppointmentsPageState createState() => _AppointmentsPageState();
}

class _AppointmentsPageState extends State<AppointmentsPage> {
  late Future<List<Appointment>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = MongoDatabase.instance.fetchAppointmentsWithPatientNames() as Future<List<Appointment>>; 
   /* futureAppointments = MongoDatabase.instance.fetchAppointments()
       .then((cursor) => cursor.map((item) => Appointment.fromJson(item)).toList());*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: FutureBuilder<List<Appointment>>(
        future: futureAppointments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(' Patient Name: ${snapshot.data![index].patientName}'),
                   subtitle: Text(snapshot.data![index].dateTime),
                 // subtitle: Text('ID: ${snapshot.data![index].id}'),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          
          return CircularProgressIndicator();
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
class Appointment {
  final String id;
  final String dateTime;
  final String patientName;

  Appointment({
    required this.id,
    required this.dateTime,
    required this.patientName,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['_id'],
      dateTime: json['dateTime'],
      patientName: json['patientName'],
    );
  }

 Map<String, dynamic> toJson() {
  return {
    '_id': id,
    'dateTime': dateTime,
    'patientName': patientName,
  };
}

 
}*/