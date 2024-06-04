
/*
import 'package:flutter/material.dart';
import 'package:last_1/patient/rdv_handler.dart';
class Appointment {
  final String id;
  final String patientName;
  final DateTime appointmentDate;
  final TimeOfDay appointmentTime;
  final bool isBooked;

  Appointment({required this.id, required this.patientName, required this.appointmentDate, required this.appointmentTime, required this.isBooked});

  Map<String, dynamic> toMap(BuildContext context) {
    return {
      'id': id,
      'patientName': patientName,
      'appointmentDate': appointmentDate.toIso8601String(),
      'appointmentTime': appointmentTime.format(context ),
      'isBooked': isBooked,
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      patientName: map['patientName'],
      appointmentDate: DateTime.parse(map['appointmentDate']),
      appointmentTime: TimeOfDay.fromDateTime(DateTime.parse(map['appointmentTime'])),
      isBooked: map['isBooked'],
    );
  }

  static Appointment fromJson(Map map) {}
}

class AvailableSlotsScreen extends StatefulWidget {
  @override
  _AvailableSlotsScreenState createState() => _AvailableSlotsScreenState();
}

class _AvailableSlotsScreenState extends State<AvailableSlotsScreen> {
  List<String> _availableSlots = ['10:00', '11:00', '12:00', '13:00', '14:00'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choisir un rendez-vous'),
      ),
      body: ListView.builder(
        itemCount: _availableSlots.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Rendez-vous ${_availableSlots[index]}'),
            onTap: () {
              // Handle slot selection
              _handleSlotSelection(_availableSlots[index]);
            },
          );
        },
      ),
    );
  }

  void _handleSlotSelection(String slot) {
  // Generate a unique ID for the appointment using the current timestamp
  String appointmentId = DateTime.now().millisecondsSinceEpoch.toString();
  // Navigate to the booking confirmation screen
  Navigator.push(
    context as BuildContext,
    MaterialPageRoute(
      builder: (context) => BookingConfirmationScreen(slot: slot, appointmentId: appointmentId),
    ),
  );
}
  
}*/