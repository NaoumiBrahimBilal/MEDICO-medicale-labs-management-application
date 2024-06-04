// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:ffi';
//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
   // ObjectId id;
    String id;
     
    String firstname;
    String lastname;
    String email;
    String password;
    String nif;


    MongoDbModel({
        required this.id,
        required this.firstname,
        required this.lastname,
        required this.email,
        required this.password,
        required this.nif
    });

    factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password:json["password"],
        nif: json["nif"]
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password":password,
        "nif":nif,
    };
}
