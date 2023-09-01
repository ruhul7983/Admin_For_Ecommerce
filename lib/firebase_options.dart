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
    apiKey: 'AIzaSyBWTfXhZfg6FwBJBgIODz1KDEZgv5jFe5A',
    appId: '1:122506372651:web:53e10a672078ce855bac6e',
    messagingSenderId: '122506372651',
    projectId: 'e-commerce-b2415',
    authDomain: 'e-commerce-b2415.firebaseapp.com',
    storageBucket: 'e-commerce-b2415.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDUOsTd9W4jGA8fq_foAOc_xL0DUlth70',
    appId: '1:122506372651:android:2d79cd87dbe1c37e5bac6e',
    messagingSenderId: '122506372651',
    projectId: 'e-commerce-b2415',
    storageBucket: 'e-commerce-b2415.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsfA_Z_2ATyWPUqR7kR_ovyYKzY_lII3Y',
    appId: '1:122506372651:ios:33578d121eda10165bac6e',
    messagingSenderId: '122506372651',
    projectId: 'e-commerce-b2415',
    storageBucket: 'e-commerce-b2415.appspot.com',
    iosClientId: '122506372651-i76f2a119raq7db047ik1qbv8kqjoeoq.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceAdmin',
  );
}
