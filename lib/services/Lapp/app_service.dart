import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/services/Lapp/app_model.dart';


class AppointmentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: FutureBuilder<List<appointment>>(
        future: MongoDatabase.getAppointments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].date.toString()),
                  subtitle: Text(snapshot.data![index].status),
                );
              },
            );
          }
  }),
  );
  
  }
}
class BookAppointmentScreen extends StatelessWidget {
  final TextEditingController dateController = TextEditingController();

  Future<void> bookAppointment() async {
    var appointmentData = appointment(
     // id: '', // Let MongoDB generate the ID
      userId: 'user123', // Get this dynamically based on the logged-in user
      date: DateTime.now(),
      status: 'pending',
    );
    await MongoDatabase.createAppointment(appointmentData);
    // Navigate back or refresh the list
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: dateController,
              decoration: InputDecoration(hintText: "Enter Date"),
            ),
            ElevatedButton(
              onPressed: bookAppointment,
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}