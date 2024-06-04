
// ignore_for_file: unused_import

/*
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/login-register_handler/log_out.dart';
import 'package:flutter/foundation.dart'; 

class acceuil extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acceuil'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
        /*  Positioned.fill(
            child: Image.asset(
              'assets/images/lab.jpg',
              fit: BoxFit.cover,
             // opacity: 0,
            ),
          ),*/
          // Stock Button
          Positioned(
            top: MediaQuery.of(context).size.height / 6.5,
            left: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/stock');
                },
                child: Text('Stock'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          // Finance Button
          Positioned(
            top: MediaQuery.of(context).size.height / 6.5,
            right: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton(
                onPressed: () {
                  _showPasswordDialog(context);
                },
                child: Text('finance'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          // Reception Button
          Positioned(
            bottom: MediaQuery.of(context).size.height / 3,
            left: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/appointmentslist');
                },
                child: Text('reception'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          // Personnel Button
          Positioned(
            bottom: MediaQuery.of(context).size.height / 3,
            right: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/staff');
                },
                child: Text('Personnel'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          // Add Result Button
          Positioned(
            bottom: MediaQuery.of(context).size.height / 8,
            right: MediaQuery.of(context).size.width / 1.85 - 6,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/plist');
                },
                child: Text('add result'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          // Add Services Button
          Positioned(
            bottom: MediaQuery.of(context).size.height / 8,
            right: MediaQuery.of(context).size.width / 4 - 50,
            child: Container(
              width: 130,
              height: 130,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/service');
                },
                child: Text('add services'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(225, 245, 253, 245),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPasswordDialog(BuildContext context) async {
    String? enteredPassword;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    enteredPassword = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                _verifyPassword(context, enteredPassword);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _verifyPassword(BuildContext context, String? enteredPassword) async {
    bool isPasswordCorrect = await MongoDatabase.verifyPassword(enteredPassword?? '');
    if (isPasswordCorrect) {
      Navigator.pushNamed(context, '/finance');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('correct password.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect password.')),
      );
    }
  }
}*/
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/login-register_handler/log_out.dart';

class acceuil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acceuil'),
        backgroundColor: Color.fromARGB(255, 130, 233, 181),
        actions: <Widget>[
          
        ],
      ),
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 189, 223, 206)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
          // Buttons Grid
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  _buildCard(
                    context,
                    icon: Icons.store,
                    label: 'Stock',
                    onPressed: () => Navigator.pushNamed(context, '/stock'),
                  ),
                  _buildCard(
                    context,
                    icon: Icons.monetization_on,
                    label: 'Finance',
                    onPressed: () => _showPasswordDialog(context),
                  ),
                  _buildCard(
                    context,
                    icon: Icons.assignment_ind,
                    label: 'Reception',
                    onPressed: () => Navigator.pushNamed(context, '/appontmentslist'),
                  ),
                  _buildCard(
                    context,
                    icon: Icons.people,
                    label: 'Personnel',
                    onPressed: () => Navigator.pushNamed(context, '/staff'),
                  ),
                  _buildCard(
                    context,
                    icon: Icons.add,
                  label: '  Ajouter \n  resultat',
                    onPressed: () => Navigator.pushNamed(context, '/plist'),
                  ),
                  _buildCard(
                    context,
                    icon: Icons.miscellaneous_services,
                    label: '   Ajouter  \n  services',
                    onPressed: () => Navigator.pushNamed(context, '/service'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showPasswordDialog(BuildContext context) async {
    String? enteredPassword;
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Password'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  obscureText: true,
                  onChanged: (value) {
                    enteredPassword = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                _verifyPassword(context, enteredPassword);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _verifyPassword(BuildContext context, String? enteredPassword) async {
    bool isPasswordCorrect = await MongoDatabase.verifyPassword(enteredPassword ?? '');
    if (isPasswordCorrect) {
      Navigator.pushNamed(context, '/finance');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Correct password.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect password.')),
      );
    }
  }

  Card _buildCard(BuildContext context, {required IconData icon, required String label, required VoidCallback onPressed}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.blue.withAlpha(30),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.blue),
              SizedBox(height: 10),
              Text(
                label,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
