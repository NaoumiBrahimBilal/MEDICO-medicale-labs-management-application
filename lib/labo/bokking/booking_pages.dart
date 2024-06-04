
// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/bokking/displaying-app.dart';
import 'package:uuid/uuid.dart';

class BookingPages extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPages> {
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
        
        title: Text('Reception'),
        
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      /*body: FutureBuilder<List<Map<String, dynamic>>>(
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
      ),*/
    /* floatingActionButton: FloatingActionButton(
        onPressed: () => _selectDate(context),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
        tooltip: 'Sélectionner la date',
        child: Icon(Icons.calendar_today),
      ),
      
    );*/
    floatingActionButton: FloatingActionButton(
            onPressed: _navigateToDetailsPage,
            backgroundColor: Color.fromARGB(112, 172, 10, 10),
            tooltip: 'Voir les rendez-vous',
            child: Icon(Icons.list),
    ));
  }
}
