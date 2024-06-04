// ignore_for_file: prefer_const_constructors, duplicate_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:last_1/dbhelper/mongo.dart'; // Assuming MongoDatabase is properly set up in your project
import 'package:last_1/labo/bokking/my_app.dart';
import 'package:uuid/uuid.dart';
/*
class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final Uuid uuid = Uuid();
  late Future<List<Map<String, dynamic>>> _appointments;

  @override
  void initState() {
    super.initState();
    _appointments = MongoDatabase.fetchAppointments('2024-05-26'); // Fetch appointments for a specific date
  }

  void _bookAppointment(int hour) async {
    String date = '2024-05-26'; // Example date, you might want to use a date picker
    bool isBooked = await MongoDatabase.checkAvailability(date, hour);
    if (isBooked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cette heure est déjà réservée.')),
      );
    } else {
      await MongoDatabase.bookAppointment(date, hour);
      setState(() {
        _appointments = MongoDatabase.fetchAppointments(date);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rendez-vous réservé avec succès.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réserver un rendez-vous'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _appointments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: 8, // From 8 AM to 3 PM
              itemBuilder: (context, index) {
                int hour = 8 + index;
                bool isBooked = snapshot.data!
                    .any((appointment) => appointment['hour'] == hour && appointment['booked']);
                return ListTile(
                  title: Text('$hour:00 - ${hour + 1}:00'),
                  subtitle: Text(isBooked ? 'Réservé' : 'Disponible'),
                  trailing: isBooked ? null : ElevatedButton(
                    onPressed: () => _bookAppointment(hour),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(113, 26, 226, 159),
                    ),
                    child: Text('Réserver'),
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

/*

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final Uuid uuid = Uuid();
  late String _selectedDate;
  late Future<List<Map<String, dynamic>>> _appointments;
  final credential =FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()); // Initialize with current date
    _loadAppointments();
  }

  void _loadAppointments() {
    _appointments = MongoDatabase.fetchAppointments(_selectedDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = DateFormat('yyyy-MM-dd').format(picked);
        _loadAppointments();
      });
    }
  }

  void _bookAppointment(int hour) async {
    bool isBooked = await MongoDatabase.checkAvailability(_selectedDate, hour);
    if (isBooked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cette heure est déjà réservée.')),
      );
    } else {
      await MongoDatabase.bookAppointment(_selectedDate, hour,credential.currentUser!.uid);
      setState(() {
        _loadAppointments();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rendez-vous réservé avec succès.')),
      );
    }
  }
  void _navigateToDetailsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AppointmentDetailsPage(date: _selectedDate), // Pass the selected date here
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('$_selectedDate'),
        
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _appointments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: 8, // From 8 AM to 3 PM
              itemBuilder: (context, index) {
                int hour = 8 + index;
                bool isBooked = snapshot.data!
                    .any((appointment) => appointment['hour'] == hour && appointment['booked']);
                return ListTile(
                  title: Text('$hour:00 - ${hour + 1}:00'),
                  subtitle: Text(isBooked ? 'Réservé' : 'Disponible'),
                  trailing: isBooked ? null : ElevatedButton(
                    onPressed: () => _bookAppointment(hour),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(113, 26, 226, 159),
                    ),
                    child: Text('Réserver'),
                  ),
                );
              },
            );
          }
        },
      ),
     floatingActionButton: FloatingActionButton(
        onPressed: () => _selectDate(context),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
        tooltip: 'Sélectionner la date',
        child: Icon(Icons.calendar_today),
      ),
      
    );
   /* floatingActionButton: FloatingActionButton(
            onPressed: _navigateToDetailsPage,
            backgroundColor: Color.fromARGB(112, 172, 10, 10),
            tooltip: 'Voir les rendez-vous',
            child: Icon(Icons.list),
    ));
  }*/
}
}*/
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final Uuid uuid = Uuid();
  late String _selectedDate;
  late Future<List<Map<String, dynamic>>> _appointments;
  final credential = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()); // Initialize with current date
    _loadAppointments();
  }

  void _loadAppointments() {
    _appointments = MongoDatabase.fetchAppointments(_selectedDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = DateFormat('yyyy-MM-dd').format(picked);
        _loadAppointments();
      });
    }
  }

  void _bookAppointment(int hour) async {
    bool isBooked = await MongoDatabase.checkAvailability(_selectedDate, hour);
    if (isBooked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cette heure est déjà réservée.')),
      );
    } else {
      await MongoDatabase.bookAppointment(_selectedDate, hour, credential.currentUser!.uid);
      setState(() {
        _loadAppointments();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Rendez-vous réservé avec succès.')),
      );
    }
  }

  void _navigateToDetailsPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserAppointmentsPage(), // Pass the selected date here
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_selectedDate'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Map<String, dynamic>>>(
            future: _appointments,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erreur: ${snapshot.error}'));
              } else {
                return ListView.builder(
                  itemCount: 8, // From 8 AM to 3 PM
                  itemBuilder: (context, index) {
                    int hour = 8 + index;
                    bool isBooked = snapshot.data!
                        .any((appointment) => appointment['hour'] == hour && appointment['booked']);
                    return ListTile(
                      title: Text('$hour:00 - ${hour + 1}:00'),
                      subtitle: Text(isBooked ? 'Réservé' : 'Disponible'),
                      trailing: isBooked ? null : ElevatedButton(
                        onPressed: () => _bookAppointment(hour),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(113, 26, 226, 159),
                        ),
                        child: Text('Réserver'),
                      ),
                    );
                  },
                );
              }
            },
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: FloatingActionButton(
              onPressed: _navigateToDetailsPage,
              backgroundColor: Color.fromARGB(112, 172, 10, 10),
              tooltip: 'Voir les rendez-vous',
              child: Icon(Icons.list),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(113, 26, 226, 159),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              child: Row(
                children: [
                  Icon(Icons.calendar_today),
                  SizedBox(width: 8),
                  Text('Sélectionner la date'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}