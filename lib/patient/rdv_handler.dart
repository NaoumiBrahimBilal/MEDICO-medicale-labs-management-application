
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';

class BookingConfirmationScreen extends StatelessWidget {
  final String slot;
  final String appointmentId; // Add this line

  BookingConfirmationScreen({required this.slot, required this.appointmentId}); // Modify this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmation de rendez-vous'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Vous avez réservé un rendez-vous pour ${slot}'),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the main screen or home screen
                Navigator.pop(context);
                // Call the function to store the appointment in the database
                _storeAppointmentInDatabase(appointmentId);
              },
              child: Text('Retour'),
            ),
          ],
        ),
      ),
    );
  }

  void _storeAppointmentInDatabase(String appointmentId) {
    // Implement the logic to store the appointment in the database
    // This is a placeholder. You'll need to adjust it based on your database schema.
    MongoDatabase.insertAppointment(appointmentId);
  }
}