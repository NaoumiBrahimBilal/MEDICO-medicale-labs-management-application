
// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, unused_label

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:last_1/app/display_app.dart';
import 'package:last_1/app/one.dart';
import 'package:last_1/app/two.dart';
import 'package:last_1/dbhelper/constant.dart';
import 'package:last_1/dbhelper/mongo.dart';
import 'package:last_1/labo/A_PROPOS.dart';
import 'package:last_1/labo/acceuil.dart';
import 'package:last_1/labo/add_result.dart';
import 'package:last_1/labo/bokking/booking_pages.dart';
import 'package:last_1/labo/bokking/booking_ui.dart';
import 'package:last_1/labo/bokking/displaying-app.dart';
import 'package:last_1/labo/bokking/my_app.dart';
import 'package:last_1/labo/finance/add_fourni.dart';
import 'package:last_1/labo/finance/finance.dart';
import 'package:last_1/labo/login-register_handler/insert.dart';
import 'package:last_1/labo/login-register_handler/log_out.dart';
import 'package:last_1/labo/login-register_handler/login_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:last_1/HomePage.dart'; 
import 'package:last_1/labo/login-register_handler/login.dart';
import 'package:last_1/labo/result.dart';
import 'package:last_1/labo/search.dart';
import 'package:last_1/labo/staff.dart';
import 'package:last_1/labo/stock/stock.dart';
import 'package:last_1/new_appoi/dis_app/dis.dart';
import 'package:last_1/new_appoi/dis_app/dis_1.dart';
//import 'package:last_1/new_appoi/dis_app/dis_1.dart';
import 'package:last_1/new_appoi/waji.dart';
import 'package:last_1/others/firebase_options.dart';
import 'package:last_1/others/labs.dart';
import 'package:last_1/others/upload_file.dart';
import 'package:last_1/patient/acceuilpa.dart';
import 'package:last_1/patient/con_result.dart';
import 'package:last_1/patient/pdf_display/pdf_view.dart';
import 'package:last_1/patient/plogin.dart';
import 'package:last_1/patient/pregister.dart';
import 'package:last_1/patient/rdv.dart';
import 'package:last_1/patient/view_result.dart';
import 'package:last_1/patient/view_services.dart';
import 'package:last_1/patient/widgets.dart';
import 'package:last_1/services/Lapp/app_service.dart';
import 'package:last_1/services/add_services.dart'; 
import 'package:flutter/foundation.dart'; // Import DebugShowCheckedModeBanner

void main() async {
  late String _selectedDate;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
   
  );
   DebugShowCheckedModeBanner:false;
   await MongoDatabase.connect(MONGO_CONN_URL);
  runApp(MyApp());
 
}

class MyApp extends StatelessWidget {
  
  final credential =FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: LoginService.isUserSignedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == true) {
              
              return HomePage();
            } else {
              
              return HomePage();
            }
          } else {
            
            return CircularProgressIndicator();
          }
        },
      ),
      routes: {
        
        '/insert': (context) => MongoDbinsert(),
        '/plogin': (context) => plogin(),
        '/login': (context) => Login(),
        '/pregister': (context) => pregister(),
        '/acceuil': (context) => acceuil(),
        '/staff': (context) => AddPersonnelPage(),
        '/patacceuil': (context) => acceuilpa(),
        '/resultats':(context) => ResultScreen(patientId: '_id',),
        '/con_reultats': (context) => pdff(patientId: '_id'),//PdfViewerWidget(fileName: 'fileName',),//PdfViewerScreen(),
        '/service': (context) => InputPage(),
       '/rdv': (context) =>   BookingPage(),//BookAppointmentScreen(),//AppointmentListScreen(),//ExistingScreen( appointmentId: credential.currentUser!.uid,),
        '/mes_rdv':(context) =>UserAppointmentsPage(),
        '/upload': (context) => UploadPage(),
        '/stock': (context) => StockPage(),
        '/finance': (context) => FourniPage(),
        '/con_services': (context) => ServicesPage(),
        'logout':(context) => LogoutPage(),
        '/fournisseur':(context) => FourniPage(),
        '/labs':(context) => LabsPage(),
        '/plist':(context)=>PatientListPage(),
        '/appointments':(context)=>MyWidget(),
        //'/appointmentslist':(context)=> AppointmentsPage(),
        //'/appointmentslist1':(context)=>MyWidgett(),
        '/addfourni':(context)=>AddFournisseurPage(),
        '/apropos':(context)=>LaboratoryInfoPage(),
        '/appontmentslist':(context)=>BookingPages(),
   } );
  }
}
