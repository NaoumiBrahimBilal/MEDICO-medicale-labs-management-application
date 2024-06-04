
// ignore_for_file: prefer_const_constructors, duplicate_import, library_prefixes, unused_import

  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/acceuil.dart';
import 'package:last_1/labo/login-register_handler/login_service.dart';
import 'package:last_1/models/MongoDbModel.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
/*
class MongoDbinsert extends StatefulWidget {
  const MongoDbinsert({super.key});

  @override
  State<MongoDbinsert> createState() => _MongoDbinsertState();
}

class _MongoDbinsertState extends State<MongoDbinsert> {
  var fnameController = new TextEditingController();
  var lnameController = new TextEditingController();
  var emailController = new TextEditingController();
  var passwordController = new TextEditingController();
  var nifController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text("Register Page", style: TextStyle(fontSize: 22)),
              SizedBox(height: 50),
              TextField(
                controller: fnameController,
                decoration: InputDecoration(labelText: "first name"),
              ),
              TextField(
                controller: lnameController,
                decoration: InputDecoration(labelText: "lastname"),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "adresse"),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "password"),
                obscureText: true,
              ),
              TextField(
                controller: nifController,
                decoration: InputDecoration(labelText: "nif"),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (fnameController.text.isEmpty || lnameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || nifController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields must be filled")));
                        return;
                      }
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                        await LoginService.setUser(userCredential.user!.uid);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user created successfully")));
                        //await storeUserDetailsInMongoDB(lnameController.text,fnameController.text,emailController.text,passwordController.text,nifController.text);
                        MongoDbModel model = MongoDbModel( id: userCredential.user!.uid,
                        email: emailController.text,
                         firstname: fnameController.text, 
                         lastname: lnameController.text,
                          password: passwordController.text, 
                          nif: nifController.text,);
                      
                        MongoDatabase.insert(model);
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  acceuil()));
                      
                      } catch (e) {
                        if (e is FirebaseAuthException && e.code == 'email-already') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email already exists")));
                        } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred: ${e.toString()}")));                        }
                      }
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  */
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/acceuil.dart';
import 'package:last_1/labo/login-register_handler/login_service.dart';
import 'package:last_1/models/MongoDbModel.dart';
//import 'package:mongo_dart/mongo_dart.dart' as M;

class MongoDbinsert extends StatefulWidget {
  const MongoDbinsert({Key? key}) : super(key: key);

  @override
  State<MongoDbinsert> createState() => _MongoDbinsertState();
}

class _MongoDbinsertState extends State<MongoDbinsert> {
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nifController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lab\'s Registration Page'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 71, 137, 212), // Consistent with the login page
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   // Text("Register Page", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    //SizedBox(height: 50),
                    TextField(
                      controller: fnameController,
                      decoration: InputDecoration(
                        labelText: "First Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: lnameController,
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: nifController,
                      decoration: InputDecoration(
                        labelText: "NIF",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.badge),
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () async {
                      if (fnameController.text.isEmpty || lnameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || nifController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields must be filled")));
                        return;
                      }
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
                        await LoginService.setUser(userCredential.user!.uid);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("user created successfully")));
                        //await storeUserDetailsInMongoDB(lnameController.text,fnameController.text,emailController.text,passwordController.text,nifController.text);
                        MongoDbModel model = MongoDbModel( id: userCredential.user!.uid,
                        email: emailController.text,
                         firstname: fnameController.text, 
                         lastname: lnameController.text,
                          password: passwordController.text, 
                          nif: nifController.text,);
                      
                        MongoDatabase.insert(model);
                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  acceuil()));
                      
                      } catch (e) {
                        if (e is FirebaseAuthException && e.code == 'email-already') {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email already exists")));
                        } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An error occurred: ${e.toString()}")));                        }
                      }
                    },
                     
                      child: Text("Register"),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, 
                        backgroundColor: Color.fromARGB(255, 71, 137, 212),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 5,
                        shadowColor: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}