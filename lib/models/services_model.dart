// models/services_model.dart
// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:bson/bson.dart';

class ServiceDocument {
  final String title;
  final String description;

  ServiceDocument({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory ServiceDocument.fromMap(Map<String, dynamic> map) {
    return ServiceDocument(
      title: map['title'],
      description: map['description'],
    );
  }
}