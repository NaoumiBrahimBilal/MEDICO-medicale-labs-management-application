class appointment {
 // final String id;
  final String userId;
  final DateTime date;
  final String status;

  appointment({ required this.userId, required this.date, required this.status});

  factory appointment.fromJson(Map<String, dynamic> json) {
    return appointment(
    //  id: json['_id'].toHexString(),
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
    //  '_id': ObjectId.fromHexString(id),
      'userId': userId,
      'date': date.toString(),
      'status': status,
    };
  }
}