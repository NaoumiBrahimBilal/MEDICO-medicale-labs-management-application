// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:ffi';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:mongo_dart/mongo_dart.dart';

PMongoDbModel mongoDbModelFromJson(String str) => PMongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(PMongoDbModel data) => json.encode(data.toJson());

class PMongoDbModel {
    String id;
    String firstname;
    String lastname;
    String email;
    String password;
   


    PMongoDbModel({
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.email,
        required this.password,
     
    });

    factory PMongoDbModel.fromJson(Map<String, dynamic> json) => PMongoDbModel(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password:json["password"],
       
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password":password,
       
    };
}
