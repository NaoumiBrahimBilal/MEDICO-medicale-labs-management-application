// ignore_for_file: implementation_imports, unused_import

/*
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/models/services_model.dart';

import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  List<Map<String, String>> _entries = []; 
  late MongoDatabase mongodb;

 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _field1Controller,
              decoration: InputDecoration(labelText: 'Title'), 
            ),
            SizedBox(height: 16),
            TextField(
              controller: _field2Controller,
              decoration: InputDecoration(labelText: 'Description'), 
            ),
            SizedBox(height: 16),
            

ElevatedButton(
  onPressed: () async {
    String title =_field1Controller.text;
    String description=_field2Controller.text;
    setState(() {
      _entries.add({
        'title': _field1Controller.text,
        'description': _field2Controller.text,
      });
   
    });

    
    await MongoDatabase.insertEntry('services', {
      'title': title,
      'description': description,
    });
    setState(() {
      _field1Controller.clear();
      _field2Controller.clear();
    });
  },
  
  child: Text('Add'),
),
          
            Expanded(
              child:
               FutureBuilder<List<Map<String, dynamic>>>(
        future: MongoDatabase.getServices(), //  db search
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var service = snapshot.data![index];
                return ListTile(
                  title: Text(service['title']),
                  subtitle: Text(service['description']),
                );
              },
            );
          }
        },
      ),
             
            ),
          ],
        ),
      ),
    );
  }
}*/


/*
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/models/services_model.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  List<Map<String, String>> _entries = [];
  late MongoDatabase mongodb;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Page'),
        backgroundColor: Color.fromARGB(255, 71, 137, 212),// Updated app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _field1Controller,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _field2Controller,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String title = _field1Controller.text;
                String description = _field2Controller.text;
                setState(() {
                  _entries.add({
                    'title': title,
                    'description': description,
                  });
                });

                await MongoDatabase.insertEntry('services', {
                  'title': title,
                  'description': description,
                });
                setState(() {
                  _field1Controller.clear();
                  _field2Controller.clear();
                });
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, 
                backgroundColor: Color.fromARGB(255, 44, 219, 146), // Button text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: MongoDatabase.getServices(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var service = snapshot.data![index];
                        return ListTile(
                          title: Text(service['title']),
                          subtitle: Text(service['description']),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:bson/src/classes/object_id.dart';
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/models/services_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart'; // Import Google Fonts package

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  List<Map<String, String>> _entries = [];
  late MongoDatabase mongodb;
    final Uuid uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add services'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159), // App bar color
        centerTitle: true, // Center the app bar title
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          children: [
            Card(
              elevation: 5.0,
              margin: EdgeInsets.only(bottom: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _field1Controller,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: GoogleFonts.poppins(color: Colors.grey.shade600),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade500),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _field2Controller,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: GoogleFonts.poppins(color: Colors.grey.shade600),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue.shade500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String id = uuid.v4();
                String title = _field1Controller.text;
                String description = _field2Controller.text;
                setState(() {
                 
                  _entries.add({
                  
                   '_id':id,
                    'title': title,
                    'description': description,
                  });
                });

                await MongoDatabase.insertEntry('services', {
                  '_id':id,
                   
                  'title': title,
                  'description': description,
                });
                setState(() {
                  _field1Controller.clear();
                  _field2Controller.clear();
                });
              },
              child: Text('Add'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                 backgroundColor: Color.fromARGB(113, 26, 226, 159), // Button text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
           // SizedBox(height: 20),
                    
Expanded(
  child: FutureBuilder<List<Map<String, dynamic>>>(
    future: MongoDatabase.getServices(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            var service = snapshot.data![index];
            return ListTile(
              title: Text(service['title'], style: GoogleFonts.poppins()),
              subtitle: Text(service['description'], style: GoogleFonts.poppins()),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                //String ids=service['_id'].toString();
                var ids=service['_id'];
   
                await MongoDatabase.deleteEntryser('services',ids);
                     setState(() {});
},
              ),
            );
          },
        );
      }
    },
  ),
),

           
           /* Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: MongoDatabase.getServices(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var service = snapshot.data![index];
                        return ListTile(
                          title: Text(service['title'], style: GoogleFonts.poppins()),
                          subtitle: Text(service['description'], style: GoogleFonts.poppins()),
                        );
                      },
                    );
                  }
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}