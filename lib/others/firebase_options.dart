// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC21izmg91mRj2RuVKP2lskUzYyKewISiU',
    appId: '1:995781138387:web:02463ea14ddf1d2ba54126',
    messagingSenderId: '995781138387',
    projectId: 'last-pfe-5a47d',
    authDomain: 'last-pfe-5a47d.firebaseapp.com',
    storageBucket: 'last-pfe-5a47d.appspot.com',
    measurementId: 'G-FDDCER74D2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDo7b_ifnCH6AeIOnsUf6rILqoELWARR8U',
    appId: '1:995781138387:android:7b36f3fb7ab1c7e3a54126',
    messagingSenderId: '995781138387',
    projectId: 'last-pfe-5a47d',
    storageBucket: 'last-pfe-5a47d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoI5sL6oZlSFaN5bFgf1uxCWOjHanmnV4',
    appId: '1:995781138387:ios:05a8dafb4e28cb7ca54126',
    messagingSenderId: '995781138387',
    projectId: 'last-pfe-5a47d',
    storageBucket: 'last-pfe-5a47d.appspot.com',
    iosBundleId: 'com.example.last1',
  );
}
