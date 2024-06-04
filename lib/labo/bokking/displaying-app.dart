/*import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; // Adjust the import based on your project structure

class AppointmentDetailsPage extends StatelessWidget {
  final String date;

  AppointmentDetailsPage({required this.date});

  Future<List<Map<String, dynamic>>> _fetchAppointmentsWithPatientDetails() async {
    List<Map<String, dynamic>> appointments = await MongoDatabase.fetchAppointments(date);
    for (var appointment in appointments) {
      if (appointment.containsKey('userId')) {
        var patientDetails = await MongoDatabase.fetchPatientDetails(appointment['userId']);
        appointment['patientName'] = patientDetails != null ? '${patientDetails['firstname']} ${patientDetails['lastname']}' : 'Unknown';
      } else {
        appointment['patientName'] = 'Unknown';
      }
    }
    return appointments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails des rendez-vous '),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchAppointmentsWithPatientDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun rendez-vous trouvé pour cette date.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var appointment = snapshot.data![index];
                return ListTile(
                  title: Text('${appointment['hour']}:00 - ${appointment['hour'] + 1}:00'),
                  subtitle: Text('Réservé par ${appointment['patientName']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; // Adjust the import based on your project structure

class AppointmentDetailsPage extends StatelessWidget {
  final String date;

  AppointmentDetailsPage({required this.date});

  Future<List<Map<String, dynamic>>> _fetchAppointmentsWithPatientDetails() async {
    List<Map<String, dynamic>> appointments = await MongoDatabase.fetchAppointments(date);
    for (var appointment in appointments) {
      if (appointment.containsKey('userId')) {
        var patientDetails = await MongoDatabase.fetchPatientDetails(appointment['userId']);
        appointment['patientName'] =
            patientDetails != null ? '${patientDetails['firstname']} ${patientDetails['lastname']}' : 'Unknown';
      } else {
        appointment['patientName'] = 'Unknown';
      }
    }
    return appointments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des rendez-vous'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchAppointmentsWithPatientDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun rendez-vous trouvé pour cette date.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var appointment = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Réservé par ${appointment['patientName']}',style: TextStyle(fontWeight: FontWeight.w900)),
                        Text(
                          '${appointment['hour']}:00 - ${appointment['hour'] + 1}:00',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      
                         Text('${appointment['date']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final String date;

  AppointmentDetailsPage({required this.date});
Future<List<Map<String, dynamic>>> _fetchAppointmentsWithPatientDetails() async {
  // Fetch all appointments
  List<Map<String, dynamic>> appointments = await MongoDatabase.fetchAppointments(date);
  
  // Fetch all patients
  List<Map<String, dynamic>> patients = await MongoDatabase.fetchAllPatients();
  
  // Create a map of patient IDs to patient details for easier lookup
  Map<String, Map<String, dynamic>> patientMap = {};
  patients.forEach((patient) {
    patientMap[patient['_id']] = patient;
  });

  // Add patient details to appointments
  for (var appointment in appointments) {
    // Get patient details from the patient map using userId
    Map<String, dynamic>? patientDetails = patientMap[appointment['userId']];
    if (patientDetails != null) {
      // Add patient name to the appointment details
      appointment['patientName'] = '${patientDetails['firstname']} ${patientDetails['lastname']}';
    } else {
      // If patient details not found, mark patient name as unknown
      appointment['patientName'] = 'Unknown';
    }
  }

  return appointments;
}


/*
  Future<List<Map<String, dynamic>>> _fetchAppointmentsWithPatientDetails() async {
    List<Map<String, dynamic>> appointments = await MongoDatabase.fetchAppointments(date);
    for (var appointment in appointments) {
      if (appointment.containsKey('userId')) {
        var patientDetails = await MongoDatabase.fetchPatientDetails(appointment['userId']);
        if (patientDetails != null) {
          appointment['patientName'] = '${patientDetails['firstname']} ${patientDetails['lastname']}';
        } else {
          appointment['patientName'] = 'Unknown';
        }
      } else {
        appointment['patientName'] = 'Unknown';
      }
    }
    return appointments;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des rendez-vous'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchAppointmentsWithPatientDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun rendez-vous trouvé pour cette date.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var appointment = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Réservé par ${appointment['patientName']}',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text(
                          '${appointment['hour']}:00 - ${appointment['hour'] + 1}:00',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text('${appointment['date']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*//*
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; // Adjust the import based on your project structure

class AppointmentDetailsPage extends StatelessWidget {
  final String date;

  AppointmentDetailsPage({required this.date});

  Future<List<Map<String, dynamic>>> _fetchAppointmentsWithPatientDetails() async {
    // Fetch all appointments
    List<Map<String, dynamic>> appointments = await MongoDatabase.fetchAppointments(date);

    // Fetch patient details for each appointment
    List<Map<String, dynamic>> appointmentsWithPatients = [];
    for (var appointment in appointments) {
      // Fetch patient details based on the userId
      Map<String, dynamic>? patientDetails = await MongoDatabase.fetchPatientDetails(appointment['userId']);
      
      // Combine appointment and patient details
      if (patientDetails != null) {
        Map<String, dynamic> appointmentWithPatient = {
          'appointment': appointment,
          'patient': patientDetails,
        };
        appointmentsWithPatients.add(appointmentWithPatient);
      }
    }

    return appointmentsWithPatients;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des rendez-vous'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchAppointmentsWithPatientDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun rendez-vous trouvé pour cette date.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var appointmentWithPatient = snapshot.data![index];
                var appointment = appointmentWithPatient['appointments'];
                var patient = appointmentWithPatient['patients'];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rendez-vous pour ${patient["firstname"]} ${patient["lastname"]}',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text(
                          '${appointment['hour']}:00 - ${appointment['hour'] + 1}:00',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text('${appointment['date']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; // Adjust the import based on your project structure
/*
class AppointmentDetailsPage extends StatelessWidget {
  final String date;

  AppointmentDetailsPage({required this.date});

  Future<List<Map<String, dynamic>>> _fetchAppointmentsWithPatientDetails() async {
    // Fetch all appointments
    List<Map<String, dynamic>> appointments = await MongoDatabase.fetchAppointments(date);

    // Fetch patient details for each appointment
    List<Map<String, dynamic>> appointmentsWithPatients = [];
    for (var appointment in appointments) {
      // Fetch patient details based on the userId
      Map<String, dynamic>? patientDetails = await MongoDatabase.fetchPatientDetails(appointment['userId']);
      
      // Combine appointment and patient details
      if (patientDetails != null) {
        Map<String, dynamic> appointmentWithPatient = {
          'appointment': appointment,
          'patient': patientDetails,
        };
        appointmentsWithPatients.add(appointmentWithPatient);
      }
    }

    return appointmentsWithPatients;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des rendez-vous'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchAppointmentsWithPatientDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun rendez-vous trouvé pour cette date.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var appointmentWithPatient = snapshot.data![index];
                var appointment = appointmentWithPatient['appointment'];
                var patient = appointmentWithPatient['patient'];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rendez-vous pour ${patient['firstname']} ${patient['lastname']}',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        Text(
                          '${appointment['hour']}:00 - ${appointment['hour'] + 1}:00',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text('${appointment['date']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

*/
// Define Appointment Model
class Appointment {
  final String id;
  final int hour;
  final String userId;
  final String date;
  final bool booked;

  Appointment({
    required this.id,
    required this.hour,
    required this.userId,
    required this.date,
    required this.booked,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    String id = _extractId(json['_id']); // Extracting the id
    return Appointment(
      id: id,
      hour: json['hour'],
      userId: json['userId'],
      date: json['date'],
      booked: json['booked'],
    );
  }

  // Utility function to extract the id from MongoDB ObjectId
  static String _extractId(dynamic objectId) {
    if (objectId is Map<String, dynamic> && objectId.containsKey('\$oid')) {
      return objectId['\$oid'] as String;
    } else if (objectId is String) {
      return objectId;
    } else {
      return '';
    }
  }
}


// Define Patient Model
class Patient {
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;

  Patient({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
    );
  }
}
class AppointmentDetailsPage extends StatelessWidget {
  final String date;

  AppointmentDetailsPage({required this.date});

  Future<List<Appointment>> _fetchAppointmentsWithPatientDetails() async {
    // Fetch all appointments
    List<Map<String, dynamic>> appointmentsData = await MongoDatabase.fetchAppointments(date);
    
    // Fetch patient details for each appointment
    List<Appointment> appointments = [];
    for (var appointmentData in appointmentsData) {
      // Fetch patient details based on the userId
      Map<String, dynamic>? patientData = await MongoDatabase.fetchPatientDetails(appointmentData['userId']);
      
      // Combine appointment and patient details
      if (patientData != null) {
        appointments.add(
          Appointment.fromJson(appointmentData),
        );
      }
    }

    return appointments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des rendez-vous'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Appointment>>(
        future: _fetchAppointmentsWithPatientDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun rendez-vous trouvé pour cette date.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var appointment = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<Map<String, dynamic>?>(
                          future: MongoDatabase.fetchPatientDetails(appointment.userId),
                          builder: (context, patientSnapshot) {
                            if (patientSnapshot.connectionState == ConnectionState.waiting) {
                              return Text('Chargement...');
                            } else if (patientSnapshot.hasError) {
                              return Text('Erreur: ${patientSnapshot.error}');
                            } else {
                              var patientData = patientSnapshot.data;
                              if (patientData != null) {
                                var patient = Patient.fromJson(patientData);
                                return Text(
                                  'Rendez-vous pour ${patient.firstname} ${patient.lastname}',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                );
                              } else {
                                return Text('Patient introuvable');
                              }
                            }
                          },
                        ),
                        Text(
                          '${appointment.hour}:00 - ${appointment.hour + 1}:00',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text('${appointment.date}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
