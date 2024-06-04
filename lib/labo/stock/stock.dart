

// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/models/stock_model.dart';
import 'package:uuid/uuid.dart';

class StockPage extends StatefulWidget {
  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  final TextEditingController _field1Controller = TextEditingController();
  final TextEditingController _field2Controller = TextEditingController();
  List<Map<String, String>> _entries = [];
  late MongoDatabase mongodb;
   final Uuid uuid = Uuid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock '),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'stock Réactif',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _field1Controller,
              decoration: InputDecoration(
                labelText: ' Name',
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(113, 26, 226, 159)),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _field2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantité',
                labelStyle: TextStyle(color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(113, 26, 226, 159)),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              
              onPressed: () async {
                String nom = _field1Controller.text;
                String quantite = _field2Controller.text;
                String id = uuid.v4(); 
                setState(() {
                  _entries.add({
                    '_id':id,
                    'nom': nom,
                    'quantite': quantite,
                  });
                });
                await MongoDatabase.insertEntry('stock', {
                  '_id':id,
                  'nom': nom,
                  'quantite': quantite,
                });
                setState(() {
                  _field1Controller.clear();
                  _field2Controller.clear();
                });
              },
              child: Text('Add '),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                 backgroundColor: Color.fromARGB(113, 26, 226, 159),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Stock actuel:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: MongoDatabase.getStock(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var stock = snapshot.data![index];
                      return ListTile(
                        title: Text(stock['nom']),
                        subtitle: Text(stock['quantite']),
                        trailing: IconButton(
                icon: Icon(Icons.delete),
                    onPressed: () async {
                        
                          var ids=stock['_id'];
   
                  await MongoDatabase.deleteEntryser('stock',ids);
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
    );
  }
  
}
