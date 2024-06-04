// ignore_for_file: unused_import, use_key_in_widget_constructors, must_be_immutable, unused_field

/*import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/patients_d.dart';
import 'package:last_1/labo/result.dart';

class PatientListPage extends StatelessWidget {
  final TextEditingController _searchController=TextEditingController();
  List<Map<String,dynamic>>_searchResult=[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('patients List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: MongoDatabase.getpat(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
           
  return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    var service = snapshot.data![index];
    return ListTile(
      title: Text(service['firstname']),
      subtitle: Text(service['lastname']),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => ResultScreen(patientId:service['_id']),
          //  builder: (context) => PersonnelDetailPage(personnelId: service['_id']),
          ),
        );
      },
    );
  },
);
           
          }
        },
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/patients_d.dart';
import 'package:last_1/labo/result.dart';

class PatientListPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients List'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159), // Customizing the app bar background color
        actions: [
          
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: MongoDatabase.getpat(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var patient = snapshot.data![index];
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    title: Text(
                      patient['firstname'],
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      patient['lastname'],
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(patientId: patient['_id']),
                        ),
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