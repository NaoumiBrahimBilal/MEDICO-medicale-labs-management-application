// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_super_parameters, dead_code

//import 'package:appointments/dbhelper/op.dart';
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/dbhelper/op.dart';


class MyCustomListTile extends StatelessWidget {
  
  final String status;
  final String timeRange;
  final VoidCallback onTap;

  const MyCustomListTile({
    Key? key,
    required this.status,
    required this.timeRange,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.event), 
      title: Text(status),
      subtitle: Text(timeRange),
      onTap: onTap,
    );
  }
}

class ExistingScreen extends StatelessWidget {
   final String appointmentId; 

  ExistingScreen({required this.appointmentId});

  Future<void> _showBookingDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Do you want to book this?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () async {
                try {
               bool success = await MongoDatabase.updateAppointmentStatus(appointmentId, 'Unavailable');
                         if (!success) {
                    throw Exception("Update failed");
                           }
                          } catch (e) {
                             print("Exception occurred=========: $e");
                          }
                /*
                bool succes =await MongoDatabase.updateAppointmentStatus(appointmentId, 'Unavailable');
                if(succes){
                  Navigator.of(context).pop();
                  print("saaaaaaaaaaaa7777777777iiiiiit");
                }
                else{
                  print("faaaaaaaaaaaaaaaaaiiiiiiiiiiiilllllllledddd");
                }*/
                mockUpdateAppointmentStatus(true);
                
                Navigator.of(context).pop();
                 print("Failed to update appointment status");
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              MyCustomListTile(
                status: 'Available',
                timeRange: '8:00 - 8:10',
                onTap: () => _showBookingDialog(context),
              ),
              SizedBox(height: 10),
              MyCustomListTile(
                status: 'Available',
                timeRange: '8:20 - 8:30',
                onTap: () => _showBookingDialog(context),
              ),
              SizedBox(height: 10),
              MyCustomListTile(
                status: 'Available',
                timeRange: '8:40 - 8:50',
                onTap: () => _showBookingDialog(context),
              ),
              SizedBox(height: 10),
              MyCustomListTile(
                status: 'Available',
                timeRange: '9:00 - 9:10',
                onTap: () => _showBookingDialog(context),
              ),
              SizedBox(height: 10),
              MyCustomListTile(
                status: 'Available',
                timeRange: '9:20 - 9:30',
                onTap: () => _showBookingDialog(context),
              ),
              SizedBox(height: 10),
              MyCustomListTile(
                status: 'Available',
                timeRange: '9:40 - 9:50',
                onTap: () => _showBookingDialog(context),
              ),
              SizedBox(height: 10),
              MyCustomListTile(
                status: 'Available',
                timeRange: '10:00 - 10:10',
                onTap: () => _showBookingDialog(context),
              ),
              SizedBox(height: 10),
              MyCustomListTile(
                status: 'Available',
                timeRange: '10:20 - 10:30',
                onTap: () => _showBookingDialog(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}