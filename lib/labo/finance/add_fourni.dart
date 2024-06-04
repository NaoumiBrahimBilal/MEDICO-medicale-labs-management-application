import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:uuid/uuid.dart';

class AddFournisseurPage extends StatefulWidget {
  @override
  _AddFournisseurPageState createState() => _AddFournisseurPageState();
}

class _AddFournisseurPageState extends State<AddFournisseurPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _dettesController = TextEditingController();
  final TextEditingController _specialiteController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final Uuid uuid = Uuid();

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _cityController.dispose();
    _dettesController.dispose();
    _specialiteController.dispose();
     _phoneController.dispose();

    super.dispose();
  }

  void _addFournisseur() async {
    String id = uuid.v4();
    String name = _nameController.text;
    String lastname = _lastnameController.text;
    String city = _cityController.text;
    String dettes = _dettesController.text;
    String specialite = _specialiteController.text;
    String phone=_phoneController.text ;

    await MongoDatabase.insertEntry('fourni', {
      '_id': id,
      'firstname': name,
      'lastname': lastname,
      'city': city,
      'phone':phone,
      'dettes': dettes,
      'specialite': specialite,
    });

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Fournisseur'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildTextField(_nameController, 'Name'),
            SizedBox(height: 16.0),
            _buildTextField(_lastnameController, 'Lastname'),
            SizedBox(height: 16.0),
            _buildTextField(_cityController, 'City'),
            SizedBox(height: 16.0),
             _buildTextField(_phoneController, 'phone' ,keyboardType: TextInputType.number),
            
            SizedBox(height: 16.0),
            _buildTextField(_dettesController, 'Dettes', keyboardType: TextInputType.number),
            SizedBox(height: 16.0),
            _buildTextField(_specialiteController, 'Specialite'),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: _addFournisseur,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(113, 26, 226, 159),
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Add Fournisseur', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
