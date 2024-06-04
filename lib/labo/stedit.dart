
/*
import 'package:flutter/material.dart';
import 'package:last_1/labo/staff.dart';
import 'package:last_1/dbhelper/mongo.dart';


class stedit extends StatefulWidget {
 final Staffs staff;

 stedit({Key? key, required this.staff}) : super(key: key);

 @override
 _EditStaffPageState createState() => _EditStaffPageState();
}

class _EditStaffPageState extends State<stedit> {
 final TextEditingController _nameController = TextEditingController();
 final TextEditingController _ageController = TextEditingController();
 final TextEditingController _roleController = TextEditingController();
 final TextEditingController _salaryController = TextEditingController();
 final TextEditingController _absencesController = TextEditingController();

 @override
 void initState() {
    super.initState();
    _nameController.text = widget.staff.name;
    _ageController.text = widget.staff.age.toString();
    _roleController.text = widget.staff.role;
    _salaryController.text = widget.staff.salary.toString();
    _absencesController.text = widget.staff.absences.toString();
 }

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Staff Details')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: _ageController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Age')),
            TextField(controller: _roleController, decoration: InputDecoration(labelText: 'Role')),
            TextField(controller: _salaryController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Salary')),
            TextField(controller: _absencesController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Absences')),
           ElevatedButton(
                       onPressed: () {
                            //updatePersonel(); 
                                       },
                           child: Text('Save Changes'),
                            ),
          ],
        ),
      ),
    );
 }
}

// personnel_list_page.dart

import 'package:flutter/material.dart';
import 'package:last_1/labo/staff.dart';
//import 'personnel_model.dart';

class PersonnelListPage extends StatefulWidget {
 @override
 _PersonnelListPageState createState() => _PersonnelListPageState();
}

class _PersonnelListPageState extends State<PersonnelListPage> {
 List<Personnel> personnelList = []; // This should be populated from your database

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personnel List'),
      ),
      body: ListView.builder(
        itemCount: personnelList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(personnelList[index].name),
            onTap: () {
              // Navigate to a page where you can edit the personnel
              // Pass the current personnel object to the editing page
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the AddPersonnelPage
        },
        child: Icon(Icons.add),
      ),
    );
 }
}*/