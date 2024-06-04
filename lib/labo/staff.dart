// ignore_for_file: prefer_const_constructors

/*
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart'; 

class Personnel {
 String id;
 String name;
 String lastName;
 int age;
 String role;
 double salary;
 int absences;

 Personnel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.age,
    required this.role,
    required this.salary,
    required this.absences,
 });

 factory Personnel.fromMap(Map<String, dynamic> map) {
    return Personnel(
      id: map['id'],
      name: map['name'],
      lastName: map['lastName'],
      age: map['age'],
      role: map['role'],
      salary: map['salary'],
      absences: map['absences'],
    );
 }
}


class AddPersonnelPage extends StatefulWidget {
  @override
  _AddPersonnelPageState createState() => _AddPersonnelPageState();
}

class _AddPersonnelPageState extends State<AddPersonnelPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();
  final _roleController = TextEditingController();
  final _absencesController = TextEditingController();
  List<Map<String,String>> entries = [];

  
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('addpersonel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'lastname'), 
            ),
            SizedBox(height: 16),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'first-name'), 
            ),
            SizedBox(height: 16),

             TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'age'), 
            ),
            SizedBox(height: 16),
            TextField(
              controller: _salaryController,
              decoration: InputDecoration(labelText: 'salary'), 
            ),
            SizedBox(height: 16),
             TextField(
              controller: _roleController,
              decoration: InputDecoration(labelText: 'role'), 
            ),
            SizedBox(height: 16),
            TextField(
              controller: _absencesController,
              decoration: InputDecoration(labelText: 'abcences'), 
            ),
            SizedBox(height: 16),
            ElevatedButton(
  onPressed: () async {
    String name =_nameController.text;
    String lastName=_lastNameController.text;
    String age =_ageController.text;
    String role=_roleController.text;
    String salary =_salaryController.text;
    String abcences=_absencesController.text;
    setState(() {
        entries.add({
        'name': _nameController.text,
        'lastname': _lastNameController.text,
        'age': _ageController.text,
        'salaryname': _salaryController.text,
        'role': _roleController.text,
        'abcences': _absencesController.text,
      });
   
    });

    
    await MongoDatabase.insertEntry('personel', {
       'name': name,
        'lastname': lastName,
        'age': age,
        'salaryname': salary,
        'role': role,
        'abcences': abcences,
     
    });
    setState(() {
         _nameController.clear();
         _lastNameController.clear();
         _ageController.clear();
         _salaryController.clear();
         _roleController.clear();
         _absencesController.clear();
    
    });
  },
  
  child: Text('Add_personel'),
),
 Expanded(
              child:
               FutureBuilder<List<Map<String, dynamic>>>(
        future: MongoDatabase.getpersonel(), 
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
                  title: Text(service['name']),
                  subtitle: Text(service['role']),
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

  void_clearAll() {
    _nameController.text = "";
    _absencesController.text = "";
    _ageController.text = "";
    _salaryController.text = "";
    _roleController.text = "";
    _lastNameController.text = "";
  }
}*/
import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:uuid/uuid.dart';
class Personnel {
 String id;
 String name;
 String lastName;
 int age;
 String role;
 double salary;
 int absences;

 Personnel({
    required this.id,
    required this.name,
    required this.lastName,
    required this.age,
    required this.role,
    required this.salary,
    required this.absences,
 });

 factory Personnel.fromMap(Map<String, dynamic> map) {
    return Personnel(
      id: map['id'],
      name: map['name'],
      lastName: map['lastName'],
      age: map['age'],
      role: map['role'],
      salary: map['salary'],
      absences: map['absences'],
    );
 }
}



class AddPersonnelPage extends StatefulWidget {
  @override
  _AddPersonnelPageState createState() => _AddPersonnelPageState();
}

class _AddPersonnelPageState extends State<AddPersonnelPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();
  final _salaryController = TextEditingController();
  final _roleController = TextEditingController();
  
  List<Map<String,String>> entries = [];
    final Uuid uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Lighter blue background
      appBar: AppBar(
        title: Text('Add Personnel'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),// Darker blue AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView( // Allows scrolling if content overflows
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(color: Colors.black), // Black label text
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(113, 26, 226, 159)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(113, 26, 226, 159)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(113, 26, 226, 159)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _salaryController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Salary',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(113, 26, 226, 159)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _roleController,
                  decoration: InputDecoration(
                    labelText: 'Role',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color.fromARGB(113, 26, 226, 159)),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              
                ElevatedButton(
                  onPressed: () async {
                    String id = uuid.v4();
    String name =_nameController.text;
    String lastName=_lastNameController.text;
    String age =_ageController.text;
    String role=_roleController.text;
    String salary =_salaryController.text;
   
    setState(() {
        entries.add({
          '_id':id,
        'name': _nameController.text,
        'lastname': _lastNameController.text,
        'age': _ageController.text,
        'salaryname': _salaryController.text,
        'role': _roleController.text,
       
      });
   
    });

    
    await MongoDatabase.insertEntry('personel', {
      '_id':id,
      
       'name': name,
        'lastname': lastName,
        'age': age,
        'salaryname': salary,
        'role': role,
      
     
    });
    setState(() {
         _nameController.clear();
         _lastNameController.clear();
         _ageController.clear();
         _salaryController.clear();
         _roleController.clear();
        
    
    });
  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, 
                    backgroundColor:Color.fromARGB(113, 26, 226, 159), // Button text color
                  ),
                  child: Text('Add Personnel'),
                ),
                SizedBox(height: 16),
              
                FutureBuilder<List<Map<String, dynamic>>>(
                  future: MongoDatabase.getpersonel(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return ListView.builder(
                        shrinkWrap: true, 
                        physics: NeverScrollableScrollPhysics(), 
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var service = snapshot.data![index];
                          return ListTile(
                            title: Text(service['name']),
                            subtitle: Text(service['role']),
                            trailing: IconButton(
                        icon: Icon(Icons.delete),
                       onPressed: () async {
                             //String ids=service['_id'].toString();
                               var ids=service['_id'];
   
                      await MongoDatabase.deleteEntrypersonel('personel',ids);
                     setState(() {});
},
              ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void_clearAll() {
    _nameController.text = "";
    _ageController.text = "";
    _salaryController.text = "";
    _roleController.text = "";
    _lastNameController.text = "";
  }
}