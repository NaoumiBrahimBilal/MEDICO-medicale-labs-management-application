
// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/login-register_handler/login_service.dart';

class Login extends StatefulWidget { 
  @override
  _LoginState createState() => _LoginState();
  
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true; 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(' Lab\'s Login Page'),
        centerTitle: true, 
        backgroundColor: Color.fromARGB(113, 26, 226, 159), 
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
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress, 
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email, color: const Color.fromARGB(113, 26, 226, 159)),
                        fillColor: Colors.grey.shade200, 
                        filled: true, 
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: passwordController,
                      obscureText: _obscureText, 
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock, color: Color.fromARGB(113, 26, 226, 159),),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText? Icons.visibility_off : Icons.visibility, color:Color.fromARGB(113, 26, 226, 159)),
                          onPressed: () {
                            setState(() {
                              _obscureText =!_obscureText; 
                            });
                          },
                        ),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                   //  email: emailController.text;
                  //  password: passwordController.text;
                  //UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                  
// );
                   bool exists=  await MongoDatabase.emailExists(emailController.text, passwordController.text);
                   if(exists){
                    // await LoginService.setUser(userCredential.user!.uid);
                 // print(userCredential.user!.uid);
                  await MongoDatabase.emailExists(emailController.text, passwordController.text);
                  Navigator.pushReplacementNamed(context, '/acceuil');
                   }
                
                 
                else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid email or password')));
                }},
                      child: Text(' Login'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor:Color.fromARGB(113, 26, 226, 159),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), 
                        elevation: 5,
                        shadowColor: Colors.black.withOpacity(0.2), 
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/insert'),
                      child: Text('Don\'t have an account? Register', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
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