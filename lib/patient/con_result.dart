// lib/labo/consultation_des_resultats.dart
/*import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/models/services_model.dart';

class ConsultationDesResultatsPage extends StatefulWidget {
  @override
  _ConsultationDesResultatsPageState createState() => _ConsultationDesResultatsPageState();
}

class _ConsultationDesResultatsPageState extends State<ConsultationDesResultatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultation des Résultats'),
      ),
      body: FutureBuilder<List<Service>>(
        future: _fetchServices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].name),
                  subtitle: Text(snapshot.data![index].description),
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<List<Service>> _fetchServices() async {
    final services = await MongoDatabase.getServices();
    return services.map((map) => Service.fromMap(map)).toList();
  }
}*/