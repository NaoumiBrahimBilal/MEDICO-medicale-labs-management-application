/*import 'package:flutter/material.dart';
import 'package:last_1/app/one.dart';

class AppointmentsList extends StatelessWidget {
  final List<Appointment> appointments;

  const AppointmentsList({Key? key, required this.appointments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building AppointmentsList with ${appointments.length} items");
    return ListView.builder(
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return ListTile(
          title: Text('Appointment ${index + 1}'),
          subtitle: Text('Date: ${appointment.date}, Hour: ${appointment.hour}, Status: ${appointment.status}'),
        );
      },
    );
  }
}*/