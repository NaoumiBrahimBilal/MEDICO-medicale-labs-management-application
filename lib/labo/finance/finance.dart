/*import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; 

class FourniPage extends StatefulWidget {
  @override
  _FourniPageState createState() => _FourniPageState();
}

class _FourniPageState extends State<FourniPage> {
  late Future<List<Map<String, dynamic>>> _fourniDocuments;

  @override
  void initState() {
    super.initState();
    _fourniDocuments = MongoDatabase.fetchFourniDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourni Documents'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fourniDocuments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var document = snapshot.data![index];
                return ListTile(
                  title: Text('${document['firstname']} ${document['lastname']}'),
                  subtitle: Text('Phone: ${document['phone']} - City: ${document['city']} - Specialite: ${document['specialite']}-dettes: ${document['dettes']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';

class FourniPage extends StatefulWidget {
  @override
  _FourniPageState createState() => _FourniPageState();
}

class _FourniPageState extends State<FourniPage> {
  late Future<List<Map<String, dynamic>>> _fourniDocuments;

  @override
  void initState() {
    super.initState();
    _fourniDocuments = MongoDatabase.fetchFourniDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fournisseur Documents'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159), 
           
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fourniDocuments,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var document = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.person_outline, color: Color.fromARGB(113, 26, 226, 159),),
                    title: Text('${document['firstname']} ${document['lastname']}', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Phone: ${document['phone']}\n City: ${document['city']} \n Specialite: ${document['specialite']}\n Dettes: ${document['dettes']}'),
                   trailing: Icon(Icons.delete),
                    onTap: () async {
                       var ids=document['_id'];
   
                      await MongoDatabase.deleteEntrypersonel('fourni',ids);
                     setState(() {});
                      
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';

class FourniPage extends StatefulWidget {
  @override
  _FourniPageState createState() => _FourniPageState();
}

class _FourniPageState extends State<FourniPage> {
  late Future<List<Map<String, dynamic>>> _fourniDocuments;

  @override
  void initState() {
    super.initState();
    _fourniDocuments = MongoDatabase.fetchFourniDocuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fournisseur Documents'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: Stack(
        children: [
          FutureBuilder<List<Map<String, dynamic>>>(
            future: _fourniDocuments,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var document = snapshot.data![index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.person_outline,
                          color: Color.fromARGB(113, 26, 226, 159),
                        ),
                        title: Text(
                          '${document['firstname']} ${document['lastname']}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Phone: ${document['phone']}\nCity: ${document['city']}\nSpecialite: ${document['specialite']}\nDettes: ${document['dettes']}',
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () async {
                            var ids = document['_id'];
                            await MongoDatabase.deleteEntrypersonel('fourni', ids);
                            setState(() {
                              _fourniDocuments = MongoDatabase.fetchFourniDocuments();
                            });
                          },
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(113, 26, 226, 159),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/addfourni');
             
              },
              child: Text('Add New Fournisseur', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
