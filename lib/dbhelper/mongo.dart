

// ignore_for_file: unused_import, unnecessary_null_comparison, dead_code, duplicate_import, unused_local_variable

import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_1/models/MongoDbModel.dart';
import 'package:last_1/dbhelper/constant.dart';
import 'package:last_1/models/MongoDbModel.dart';
import 'package:last_1/models/PMongoDbModel.dart';
import 'package:last_1/labo/staff.dart';
import 'package:last_1/new_appoi/dis_app/dis.dart';
//import 'package:last_1/new_appoi/dis_app/dis_1.dart';
import 'package:last_1/patient/rdv.dart';
import 'package:last_1/services/Lapp/app_model.dart';
import 'package:mongo_dart/mongo_dart.dart' ;
import 'package:mongo_dart/mongo_dart.dart'as M;
import 'package:uuid/uuid.dart';

import '../labo/bokking/displaying-app.dart';
class User {
  final String id;
  final String email;
  final String password;

  User({required this.id, required this.email, required this.password});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      email: map['email'],
      password: map['password'],
    );
  }
}

class MongoDatabase {
  MongoDatabase._privateConstructor();
  static final MongoDatabase instance = MongoDatabase._privateConstructor();

  
 
  static var resultdb,
             db,
             dbb,
             userCollection
             ,personnelCollection,
             patientsCollection,
             resultCollection,
             p_v,
             log;

static Future<bool> pemailExists(String email,String password) async {
 var result = await patientsCollection.findOne({"email": email,"password":password});
 return result != null;
}

static Future<bool> emailExists(String email,String password) async {

 var result = await userCollection.findOne({"email": email,"password":password});
 return result != null;
}
 static  connect(String s) async {
  //connection to lab's database
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
      inspect(db);


      //connection to patients 's database
    dbb=await Db.create(dbb_url);
    await dbb.open();
    inspect(dbb); 
    //connection to result's database (db entre eux )
    resultdb= await Db.create(result_db);
    await resultdb.open();
    inspect(resultdb); 

    //connection to p_password database

    p_v=await Db.create(p_vv);
    await p_v.open();
    inspect(p_v);
 



    userCollection = db.collection(USER_COLLECTION);

    personnelCollection=db.collection('personel');
    patientsCollection=dbb.collection('patients');
 }
 static Future<String> insert(MongoDbModel data) async{
  try {
   var result= await userCollection.insertOne(data.toJson());
   if(result.isSuccess){
    return "data inserted";
   }
   else {
    return "something went wrong";
   }
   return result;
  } catch (e) {
    print(e.toString());
    return e.toString();
    
  }
 }



 //patients insert
 static Future<String> Pinsert(PMongoDbModel data) async{
  try {
   var result= await patientsCollection.insertOne(data.toJson());
   if(result.isSuccess){
    return "insertion avec succes";
   }
   else {
    return "";
   }
   return result;
  } catch (e) {
    print(e.toString());
    return e.toString();
    
  }
 }




static Future<String> insertPersonel(Map<String, dynamic> data) async {
 try {
    var result = await personnelCollection.insertOne(data);
    if (result.isSuccess) {
      return "Data inserted successfully";
    } else {
      return "Failed to insert data";
    }
 } catch (e) {
    print(e.toString());
    return e.toString();
 }
}


static Future<bool> verifyPassword(String enteredPassword) async {
 // Query the 'p_password' collection in the 'p_password' database
 var result = await p_v.collection('p_password').findOne({"password": enteredPassword});
 return result != null;
}
/*
static Future<String> bookAppointment(String appointmentId) async {
  try {
    
    // This is a placeholder. You'll need to adjust it based on your database schema.
    var result = await db.collection('appointments').updateOne(
      where.eq('_id', ObjectId.parse(appointmentId)),
      set: {'status': 'booked'},
    );
    if (result.isSuccess) {
      return "Appointment booked successfully";
    } else {
      return "Failed to book appointment";
    }
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}*/
// Add this method inside the MongoDatabase class in mongo.dart

static Future<String> insertAppointment(String appointmentId) async {
  try {
    // Assuming you have a collection for appointments
    var result = await db.collection('appointments').insertOne({'_id': appointmentId});
    if (result.isSuccess) {
      return "Appointment stored successfully";
    } else {
      return "Failed to store appointment";
    }
  } catch (e) {
    print(e.toString());
    return e.toString();
  }
}

/*
Future<User?> authenticateUser(TextEditingController emailController, TextEditingController passwordController) async {
String email=emailController.text;
String password=passwordController.text;
MongoDatabase mongoDatabaseINS =MongoDatabase();

  await db.open();
User? user = await mongoDatabaseINS.authenticateUser(emailController, passwordController);
  // Query the database
  DbCollection users = db.collection('login-register');
  var query = where.eq('email', email).eq('password', password);
  var result = await users.findOne(query);

  // Close the database connection
  await db.close();

  // Return the user if found, null otherwise
  return result!= null? User.fromMap(result) : null;
}*/


static Future<List<Map<String, dynamic>>> fetchFourniDocuments() async {
  var cursor = db.collection('fourni').find();
  List<Map<String, dynamic>> documents = [];
  await cursor.forEach((doc) {
    documents.add(doc);
  });
  return documents;
}


  static Future<List<Personnel>> fetchAllPersonnel() async {
    await db.open();
    List<Personnel> personnelList = [];
    var cursor = personnelCollection.find();
    await cursor.forEach((doc) {
      personnelList.add(Personnel.fromMap(doc));
    });
    return personnelList;
  }
  /*static Future<void> addService(Map<String, dynamic> service) async {
    await db.collection('services').insertOne(service);
  }*/

  /*static Future<List<Map<String, dynamic>>> getServices() async {
    return await db.collection('services').find().toList();
  }*/
  static Future<MongoDbModel> fetchUserDetailsById(String userId) async {
    final query = where.eq('_id', M.ObjectId.fromHexString(userId));
    final result = await userCollection.findOne(query);
    

    if (result == null) {
      throw Exception('User not found');
    }

    return MongoDbModel.fromJson(result);
  }
  Future<void> storeUserDetailsInMongoDB(String firstName, String lastName, String email, String password, String nif) async {
  var db = await Db.create(MONGO_CONN_URL);
  await db.open();

  var collection = db.collection('login-register');

  var newUser = {
    'lname': lastName,
    'fname': firstName,
    'email': email,
    'password': password, // Consider hashing passwords before storing
    'nif': nif,
  };
  
  await collection.insert(newUser);
  
  await db.close();
}
static Future<List<Map<String, dynamic>>> fetchlabsDocuments() async {
  var cursor = db.collection('login-register').find();
  List<Map<String, dynamic>> documents = [];
  await cursor.forEach((doc) {
    documents.add(doc);
  });
  return documents;
}

  static Future<void> insertEntry(String collectionName, Map<String, dynamic> entry) async {
   if(collectionName==null || entry ==null){
    throw ArgumentError.notNull('must be not null');

   }
    var collection = db.collection(collectionName);
    await collection.insertOne(entry);
  }
  static Future<List<Map<String, dynamic>>> getServices() async {
    var collection = db.collection('services');
    var docs = await collection.find().toList();
    return docs; // Directly return the list of documents
  }
  static Future<List<Map<String, dynamic>>> getStock() async {
    var collection = db.collection('stock');
    var docs = await collection.find().toList();
    return docs; // Directly return the list of documents
  }
   static Future<List<Map<String, dynamic>>> getpersonel() async {
    var collection = db.collection('personel');
    var docs = await collection.find().toList();
    return docs; // Directly return the list of documents
  }
 

/*
static Future<List<Map<String, dynamic>>> fetchPdfDocuments() async {
  var cursor = resultCollection.find();
  List<Map<String, dynamic>> documents = [];
  await cursor.forEach((doc) {
    documents.add(doc);
  });
  return documents;
}*/
 static Future<List<Map<String, dynamic>>> searchUsers(String searchTerm) async {
    // Assuming you have a method to connect to your MongoDB instance
    // and a collection named 'users'
    var client = await MongoDatabase.connect(MONGO_CONN_URL);
    var db = client.db('db');
    var coll = db.collection('personel');

    // Perform a text search on the 'name' field
    var results = await coll.find(where.eq('name', searchTerm)).toList();

    client.close();
    return results;
  }
   static Future<List<Map<String, dynamic>>> getpat() async {
    var collection = dbb.collection('patients');
    var docs = await collection.find().toList();
    return docs; // Directly return the list of documents
  }
  // Inside mongo.dart, add the fetchPersonnelDetails method
static Future<Map<String, dynamic>> fetchPersonnelDetails(String personnelId) async {
  var collection = dbb.collection('patients');
  var doc = await collection.findOne({'_id': personnelId});
  return doc;
}
// Inside mongo.dart, add the searchUsersByName method
static Future<List<Map<String, dynamic>>> searchUsersByName(String searchTerm) async {
  var collection = db.collection('users'); // Adjust 'users' to your actual collection name
  var query = where.lte('firstname', '%${searchTerm}%'); // Adjust 'name' to your actual field name
  var cursor = await collection.find(query);
  var documents = await cursor.toList();
  return documents;
}
///////////////////////////////
/*static Future<void> updatePatientWithPdf(String patientId, String fileName, String base64Pdf) async {
  var collection = db.collection('result');
  await collection.insertOne(
    where.eq('_id', patientId),
    update: {
      '\$set': {
        'uploadedPdf.fileName': fileName,
        'uploadedPdf.pdfContent': base64Pdf,
      },
    },
  );
}*/
// In mongo.dart

static Future<bool> updateAppointmentStatus(String appointmentId, String status) async {
  try {
    var result = await db.collection('appointments').updateOne(
      where.eq('_id', ObjectId.parse(appointmentId)),
      set: {'status': status},
    );
   print('Matched count: ${result.matchedCount}');
print('Modified count: ${result.modifiedCount}');
return result.isSuccess;
  } catch (e) {
    print(e.toString());
    return false;
  }
}
static Future<Map<String, dynamic>> getPatientDataById(String patientId) async {
  var collection = dbb.collection('patients'); // Replace with your collection name
  var doc = await collection.findOne(where.eq('_id', patientId));
  return doc;
}


Future<void> storeBooking(String id, DateTime dateTime) async {

  final credential =FirebaseAuth.instance;
  String dateTimeStr = dateTime.toIso8601String();
 var result = await db.collection('appointments').findOne({"dateTime": dateTime.toIso8601String()});
  var collection = db.collection('appointments');

 // String dateTimeStr = dateTime.toIso8601String();
if(result==null){
  var uuid = Uuid();
  String newId = uuid.v4();
  await storeBooking(newId, dateTime);
 
  var document = {
    'new_id':newId,
    '_id': credential.currentUser!.uid,
    'dateTime': dateTimeStr,
    'status':'booked'
  
  };

  
  await collection.insertOne(document);

}
else{
 throw Exception("already taken");
}
 
  
}
/*
Future<List<Map<String, dynamic>>> fetchAppointments(String date) async {
  var collection = db.collection('appointments');
  var cursor = await collection.find().toList();
  return cursor;
}*/
Future<String?> getPatientNameById(String id) async {
  var patientsCollection = dbb.collection('patients');
  var patientDoc = await patientsCollection.findOne(where.eq('_id', id));
  return patientDoc!= null? patientDoc['firstname'] : null; 
}
/*
Future<List<Appointment>> fetchAppointmentsWithPatientNames() async {
  var appointmentsCollection = db.collection('appointments');
  var appointmentsCursor = await appointmentsCollection.find().toList();

  List<Appointment> appointments = [];
  for (var appointmentDoc in appointmentsCursor) {
    String? patientName = await getPatientNameById(appointmentDoc['_id']);
    if (patientName!= null) {
      appointments.add(Appointment.fromJson({
       ...appointmentDoc,
        'patientName': patientName,
      }));
    }
  }

  return appointments;
}*/
/*static Future<List<Map<String, dynamic>>> fetchAllDocuments() async {
   const String dbName = 'db';
    // Connect to MongoDB
    if (db == null ||!db.isConnected) {
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
    }

    // Select the database and collection
    final collection = db.collection('appointments');

    // Fetch all documents from the collection
    final cursor = await collection.find().toList();

    // Convert the results to a list of maps
    final documents = cursor.map((doc) => doc.toMap()).toList();

    return documents;
  }
*/
static Future<List<Map<String, dynamic>>> fetchAllDocuments() async {
    
    if (db == null ||!db.isConnected) {
      await db.connect(); 
    }

  
    final collection = db.collection('appointments');

    
    final cursor = await collection.find().toList();

    
    return cursor;
  }
 
static Future<void> deleteService(String id) async {
   try {
    var collection = db.collection('services');
    
    
    var result = await collection.remove({'_id': id});
    
    print('Attempted to delete document with _id: $id');
  } catch (e) {
    print("Error during deletion: $e");
    rethrow;
  }
}
static Future<List<appointment>> getAppointments() async {
    final coll = db.collection('appointments');
    final result = await coll.find().toList();
    return result.map((doc) => appointment.fromJson(doc)).toList();
  }

  static Future<void> createAppointment(appointment appointment) async {
    final coll = db.collection('appointments');
    await coll.insertOne(appointment.toJson());
  }

  static Future<void> deleteAppointment(String id, String date, int hour) async {
    final coll = db.collection('appointments');
    await coll.remove({'_id': ObjectId.fromHexString(id)});
  }

  

static Future<void> deleteDocumentById(String collectionName, String id) async {
  try {
    var id ;
    if(id==null){
         throw ArgumentError('ID cannot be null');

    }
    
    var collection = db.collection(collectionName);
   var objectId=ObjectId.fromHexString(id);

    var result = await collection.remove(where.eq('_id', objectId));
    //print('Deleted document with _id: ${objectId.toHexString()} from collection $collectionName');
  } catch (e) {
    print("Error during deletion: $e");
    rethrow;
  }
}
static Future<void> deleteEntryser(String collectionName, String id) async {
  if (collectionName == null || id == null) {
    throw ArgumentError.notNull('Both collectionName and id must be non-null.');
  }
  

  try {
    var collection = db.collection(collectionName);
    //var objectId = ObjectId.fromHexString(id); // Convert string id to ObjectId
    await collection.remove(where.eq('_id', id)); // Delete one document matching the condition
    print("Successfully deleted document from $collectionName.");
  } catch (e) {
    print("Error deleting document: $e");
    // Optionally, rethrow the exception or handle it according to your application's needs
  }
}

static Future<void> deleteEntrystock(String collectionName, String id) async {
  if (collectionName == null || id == null) {
    throw ArgumentError.notNull('Both collectionName and id must be non-null.');
  }
  

  try {
    var collection = db.collection(collectionName);
    //var objectId = ObjectId.fromHexString(id); // Convert string id to ObjectId
    await collection.remove(where.eq('_id', id)); // Delete one document matching the condition
    print("Successfully deleted document from $collectionName.");
  } catch (e) {
    print("Error deleting document: $e");
    // Optionally, rethrow the exception or handle it according to your application's needs
  }
}
static Future<void> deleteEntrypersonel(String collectionName, String id) async {
  if (collectionName == null || id == null) {
    throw ArgumentError.notNull('Both collectionName and id must be non-null.');
  }
  

  try {
    var collection = db.collection(collectionName);
    //var objectId = ObjectId.fromHexString(id); // Convert string id to ObjectId
    await collection.remove(where.eq('_id', id)); // Delete one document matching the condition
    print("Successfully deleted document from $collectionName.");
  } catch (e) {
    print("Error deleting document: $e");
    // Optionally, rethrow the exception or handle it according to your application's needs
  }
}

static Future<List<Map<String, dynamic>>> fetchPdfDocuments() async {
  var collection = db.collection('result');
  var cursor = await collection.find().toList();
  return cursor;
}
static Future<void> insertPdfDocument(String patientId,String collectionName, String fileName, String base64Pdf) async {
    var collection = db.collection(collectionName);
   try {
  await collection.insertOne({
    '_id': patientId,
    'fileName': fileName,
    'pdfContent': base64Pdf,
  });
} catch (e) {
  print("Error inserting document: $e");
}
  }

static Future<void> storePdfFile(String patientId ,String filePath,  String collectionName) async {
  // Read the file as bytes
  Uint8List bytes = await File(filePath).readAsBytes();

  // Connect to the MongoDB server
 // Db db = Db('mongodb://localhost:27017/$dbName');
  //await db.open();

 
  await db.collection(collectionName).insertOne({
    '_id':patientId,
    'name': 'example.pdf',
    'data': BsonBinary.from(bytes),
  });

  // Close the connection
  await db.close();
}
static Future<Map<String, dynamic>?> fetchPdfDocument(String patientId, String collectionName) async {
   final credential =FirebaseAuth.instance;
    var collection = db.collection(collectionName);
    try {
      var document = await collection.findOne(where.eq('_id',credential.currentUser!.uid ));
      return document;
    } catch (e) {
      print("Error fetching document: $e");
      return null;
    }
  }
    static Future<void> updateEntry(String collectionName, String id, int newQuantite) async {
    await db.collection(collectionName).update(
      where.eq('_id', id),
      modify.set('quantite', newQuantite),
    );
  }
static Future<List<Map<String, dynamic>>> getEntries(String collectionName) async {
    return await db.collection(collectionName).find().toList();
  }
  static Future<List<Map<String, dynamic>>> fetchAppointments(String date) async {
    var result = await db.collection('appointments').find({'date': date}).toList();
    return result;
  }

  static Future<bool> checkAvailability(String date, int hour) async {
    var result = await db.collection('appointments').findOne({'date': date, 'hour': hour, 'booked': true});
    return result != null;
  }

  static Future<void> bookAppointment(String date, int hour,String userId) async {
    final credential =FirebaseAuth.instance;
  
    await db.collection('appointments').update(
      
      {'userId':credential.currentUser!.uid,'date': date, 'hour': hour},
      {'\$set': {'booked': true}},
      upsert: true,
    );
  }
  /*
  static Future<Map<String, dynamic>?> getUserWithAppointments(String userId) async {
  try {
  var collection = db.collection('appointments');
  var appointmentsDocs = await collection.find(where.eq('userId', userId)).toList();

  List<Appointment> appointments = [];
  for (var doc in appointmentsDocs) {
    var patientId = doc['userId'];
    var patientDoc = await dbb.collection('patients').findOne(where.eq('_id', patientId));
    if (patientDoc!= null) {
      String patientName = '${patientDoc['firstname']} ${patientDoc['lastname']}';
      Appointment? appointment = Appointment.fromMap({
       ...doc,
        'patientName': patientName,
      });
      if (appointment!= null) { // Check for null
        appointments.add(appointment);
      }
    }
  }

  return {
    'appointments': appointments,
  };
} catch (e) {
  // Use a logging framework instead of print
 // Logger().wtf(e.toString());
  return null;
}
}*/
static Future<Map<String, dynamic>?> fetchPatientDetails(String userId) async {
    var collection = dbb.collection('patients');
    var patient = await collection.findOne({'_id': userId});
    return patient;
  }
 static Future<List<Map<String, dynamic>>> fetchUserAppointments(String userId) async {
    var results = await db.collection('appointments').find({'userId': userId}).toList();
    return results;
  }
  static Future<void> delete(String userId, String date, int hour) async {
    await db.collection('appointments').remove({'userId': userId, 'date': date, 'hour': hour});
  }

}

