// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:last_1/dbhelper/mongo.dart';

/*
class UserAppointmentsPage extends StatefulWidget {
  @override
  _UserAppointmentsPageState createState() => _UserAppointmentsPageState();
}

class _UserAppointmentsPageState extends State<UserAppointmentsPage> {
  late Future<List<Map<String, dynamic>>> _userAppointments;

  @override
  void initState() {
    super.initState();
    _loadUserAppointments();
  }

  void _loadUserAppointments() {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    setState(() {
      _userAppointments = MongoDatabase.fetchUserAppointments(userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes rendez-vous'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _userAppointments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun rendez-vous trouvé.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var appointment = snapshot.data![index];
                return ListTile(
                  title: Text('Date: ${appointment['date']}'),
                  subtitle: Text('Heure: ${appointment['hour']}:00 - ${appointment['hour'] + 1}:00'),
                  trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            
                          },
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:last_1/dbhelper/mongo.dart';

class UserAppointmentsPage extends StatefulWidget {
  @override
  _UserAppointmentsPageState createState() => _UserAppointmentsPageState();
}

class _UserAppointmentsPageState extends State<UserAppointmentsPage> {
  late Future<List<Map<String, dynamic>>> _userAppointments;

  @override
  void initState() {
    super.initState();
    _loadUserAppointments();
  }

  void _loadUserAppointments() {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    setState(() {
      _userAppointments = MongoDatabase.fetchUserAppointments(userId);
    });
  }

  Future<void> _deleteAppointment(String userId, String date, int hour) async {
    await MongoDatabase.delete(userId, date, hour);
    _loadUserAppointments();  // Refresh the list of appointments
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes rendez-vous'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _userAppointments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun rendez-vous pour vous trouvé.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var appointment = snapshot.data![index];
                return ListTile(
                  title: Text('Date: ${appointment['date']}'),
                  subtitle: Text('Heure: ${appointment['hour']}:00 - ${appointment['hour'] + 1}:00'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await _deleteAppointment(
                        FirebaseAuth.instance.currentUser!.uid,
                        appointment['date'],
                        appointment['hour'],
                      );
                    },
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
