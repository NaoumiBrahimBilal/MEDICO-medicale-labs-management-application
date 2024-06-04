
// ignore_for_file: prefer_const_constructors, sort_child_properties_last


/*
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 71, 137, 212), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the App',
              style: TextStyle(fontSize: 24, color: Colors.white), 
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: Text('As Lab', style: TextStyle(color: Colors.white)), 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 71, 137, 212),  
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/plogin'),
              child: Text('As Patient', style: TextStyle(color: Colors.white)), 
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 71, 137, 212),  
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(113, 26, 226, 159), // Custom background color
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Container(
           /* decoration: BoxDecoration(
              color: Colors.white, // Change the color to match your design
              //image: DecorationImage(
                //image: AssetImage('assets/images/background.jpg'), // Make sure to add your image to the assets folder
                //fit: BoxFit.cover, // Adjust BoxFit to your preference
              ),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to MEDICO',
                  style: TextStyle(fontSize: 24, color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text('As Lab', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, 
                    backgroundColor:Color.fromARGB(113, 26, 226, 159),  // Text color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Rounded corners
                    elevation: 5,
                    shadowColor: Colors.black.withOpacity(0.2), // Subtle shadow
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/plogin'),
                  child: Text('As Patient', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, 
                    backgroundColor: Color.fromARGB(113, 26, 226, 159), // Text color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)), // Rounded corners
                    elevation: 5,
                    shadowColor: Colors.black.withOpacity(1), // Subtle shadow
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
     ) ;
  }
}