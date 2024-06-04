
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/login-register_handler/log_out.dart';

class acceuilpa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espaces Patients'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159), 
       
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: MediaQuery.of(context).size.height / 6.5,
            left: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/con_reultats');
                },
                icon: Icon(Icons.description_outlined), // Add icon here
                label: Text('Resultat'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6.5,
            right: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/con_services');
                },
                icon: Icon(Icons.local_hospital_outlined), // Add icon here
                label: Text('Services'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 3,
            left: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/apropos');
                },
                icon: Icon(Icons.info_outline), // Add icon here
                label: Text('A propos'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 3,
            right: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/rdv');
                },
                icon: Icon(Icons.event_available_outlined), // Add icon here
                label: Text('Prise de\n Rendez-vous '),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
