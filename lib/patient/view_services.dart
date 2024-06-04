// ignore_for_file: prefer_const_constructors, sort_child_properties_last

/*import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; 

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: MongoDatabase.getServices(), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var service = snapshot.data![index];
                return ListTile(
                  title: Text(service['title']),
                  subtitle: Text(service['description']),
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

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
        backgroundColor: Color.fromARGB(255, 136, 233, 201),// Custom app bar color
        shadowColor: Colors.black, // Optional: adds a shadow effect to the app bar
        elevation: 4.0, // Optional: adds depth to the app bar
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: MongoDatabase.getServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    var service = snapshot.data![index];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Adjust margins for spacing
      child: ListTile(
        leading: Icon(Icons.business, color: Color.fromARGB(113, 26, 226, 159)), // Example icon
        title: Text(
          service['title'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87), // Enhanced text styling
        ),
        subtitle: Text(
          service['description'], // Assuming 'description' exists in your data
          style: TextStyle(color: Colors.grey[600]), // Lighter grey for subtitle
        ),
       // trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue), // Arrow icon for trailing action
        onTap: () {
          // Implement your logic here, e.g., navigation, deletion
        },
      ),
      padding: EdgeInsets.all(8.0), // Padding around the ListTile
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the container
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
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