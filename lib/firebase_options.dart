// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyDYlUCFRU_MswsAB1pk-_DZtxKsouWGQyM',
    appId: '1:762147501452:web:4f82ff2827dbfe72f892a9',
    messagingSenderId: '762147501452',
    projectId: 'syncrolife-med',
    authDomain: 'syncrolife-med.firebaseapp.com',
    storageBucket: 'syncrolife-med.appspot.com',
    measurementId: 'G-9ZHCS70NWW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeXcgl6Hezkbxt2XBmlLrrb-LVv8nwmmA',
    appId: '1:762147501452:android:b948a550048fcdb5f892a9',
    messagingSenderId: '762147501452',
    projectId: 'syncrolife-med',
    storageBucket: 'syncrolife-med.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVD7eL3PEjwfYH3CN8CUtmS9k2lOjTxM8',
    appId: '1:762147501452:ios:bea7410f12d80b00f892a9',
    messagingSenderId: '762147501452',
    projectId: 'syncrolife-med',
    storageBucket: 'syncrolife-med.appspot.com',
    iosClientId: '762147501452-hj2263tfgcce4nmde6e7b885odvpps28.apps.googleusercontent.com',
    iosBundleId: 'com.example.syncrolife',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVD7eL3PEjwfYH3CN8CUtmS9k2lOjTxM8',
    appId: '1:762147501452:ios:bea7410f12d80b00f892a9',
    messagingSenderId: '762147501452',
    projectId: 'syncrolife-med',
    storageBucket: 'syncrolife-med.appspot.com',
    iosClientId: '762147501452-hj2263tfgcce4nmde6e7b885odvpps28.apps.googleusercontent.com',
    iosBundleId: 'com.example.syncrolife',
  );
}
