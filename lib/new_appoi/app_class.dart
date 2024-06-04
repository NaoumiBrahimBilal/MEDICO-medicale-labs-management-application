import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Booking {
  String id;
  DateTime date;
  TimeOfDay hour;

  Booking({required this.id, required this.date, required this.hour});

Map<String, dynamic> toJson([BuildContext? context]) {
  return {
    '_id': id,
    'date': date.toIso8601String(),
    'hour': DateFormat('HH:mm').format(date).toString(), 
  };
}

      
}