// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LaboratoryInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('À propos de notre laboratoire'),
        backgroundColor: Color.fromARGB(113, 26, 226, 159),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bienvenue dans notre laboratoire médical',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 36, 103, 161),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Notre mission',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Notre mission est de fournir des services de laboratoire médical précis et rapides pour aider au diagnostic et au traitement des maladies liées au sang. Nous nous efforçons de fournir des résultats de haute qualité avec la plus grande précision et attention, assurant ainsi la santé et le bien-être de nos patients.',
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(height: 16.0),
            Text(
              'Nos services',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Nous offrons un large panel de prestations:',
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(height: 8.0),
            _buildServiceItem('Biochimie '),
            _buildServiceItem('Hormonologie'),
            _buildServiceItem('Hémobiologie'),
            _buildServiceItem('Microbiologie'),
            _buildServiceItem('Parasitologie/Mycologie'),
            _buildServiceItem('Tests de coagulation'),
            SizedBox(height: 16.0),
            Text(
              'Pourquoi nous choisir?',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Le laboratoire est doté d\'un appareillage haut de gamme et à la pointe de technologie .Nous sommeconventionnés avec des laboratoires européens Biomnis /Cerba.',
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contactez-nous',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
            ),
            SizedBox(height: 8.0),
            Text(
              'Adresse:n face de la nouvelle agence commerciale d\'Algérie Télécom sur la route principale',
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(height: 8.0),
            Text(
              'Téléphone: (+213)  671 48 12 22',
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: drnaoumi.anfel@gmail.com',
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
            SizedBox(height: 16.0),
            
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(String service) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.check, color: Color.fromARGB(113, 26, 226, 159)),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              service,
              style: TextStyle(fontSize: 16.0, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
