// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/login-register_handler/login_service.dart';
import 'package:last_1/dbhelper/mongo.dart'as mongo; 
import 'package:last_1/models/MongoDbModel.dart'; 

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}




class _LogoutPageState extends State<LogoutPage> {
MongoDbModel? user;


  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    String? userId = await LoginService.getUser();
    if (userId!= null) {
      user = (await MongoDatabase.fetchUserDetailsById(userId)) as MongoDbModel?;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
             
              await FirebaseAuth.instance.signOut();
              
              await LoginService.clearUser();
              Navigator.pushReplacementNamed(context, '/login'); 
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${user?.email}'),
            // Additional UI elements...
            ElevatedButton(
              onPressed: () async {
                
                await FirebaseAuth.instance.signOut();
                
                await LoginService.clearUser();
                Navigator.pushReplacementNamed(context, '/login'); 
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}