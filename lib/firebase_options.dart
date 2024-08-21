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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyCMRsOEPpXJi6R1BnGQQvJmamvcMqo_MCU',
    appId: '1:1093435647429:web:e486475855e0f84a9817ac',
    messagingSenderId: '1093435647429',
    projectId: 'pokerchess-5bb3a',
    authDomain: 'pokerchess-5bb3a.firebaseapp.com',
    databaseURL: 'https://pokerchess-5bb3a-default-rtdb.firebaseio.com',
    storageBucket: 'pokerchess-5bb3a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB7iQ6hA0BmmwpCO14yL6CBwMTZFmdN7Eo',
    appId: '1:1093435647429:android:8e6e32890191824b9817ac',
    messagingSenderId: '1093435647429',
    projectId: 'pokerchess-5bb3a',
    databaseURL: 'https://pokerchess-5bb3a-default-rtdb.firebaseio.com',
    storageBucket: 'pokerchess-5bb3a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTWQArGOPrbcoXvUJOngdNhtrLNQMCqSg',
    appId: '1:1093435647429:ios:72df7f02052080d39817ac',
    messagingSenderId: '1093435647429',
    projectId: 'pokerchess-5bb3a',
    databaseURL: 'https://pokerchess-5bb3a-default-rtdb.firebaseio.com',
    storageBucket: 'pokerchess-5bb3a.appspot.com',
    iosClientId: '1093435647429-o51ljb2bncttjv46o305bdnivnhm53av.apps.googleusercontent.com',
    iosBundleId: 'com.example.exma',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTWQArGOPrbcoXvUJOngdNhtrLNQMCqSg',
    appId: '1:1093435647429:ios:72df7f02052080d39817ac',
    messagingSenderId: '1093435647429',
    projectId: 'pokerchess-5bb3a',
    databaseURL: 'https://pokerchess-5bb3a-default-rtdb.firebaseio.com',
    storageBucket: 'pokerchess-5bb3a.appspot.com',
    iosClientId: '1093435647429-o51ljb2bncttjv46o305bdnivnhm53av.apps.googleusercontent.com',
    iosBundleId: 'com.example.exma',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCMRsOEPpXJi6R1BnGQQvJmamvcMqo_MCU',
    appId: '1:1093435647429:web:96d973003bdc4c0c9817ac',
    messagingSenderId: '1093435647429',
    projectId: 'pokerchess-5bb3a',
    authDomain: 'pokerchess-5bb3a.firebaseapp.com',
    databaseURL: 'https://pokerchess-5bb3a-default-rtdb.firebaseio.com',
    storageBucket: 'pokerchess-5bb3a.appspot.com',
  );

}