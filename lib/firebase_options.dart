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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD2WRhT_MnsM9nIqHrWDQeh6VH4stWVyx4',
    appId: '1:916710267822:web:2820f04b41a1a73eda463f',
    messagingSenderId: '916710267822',
    projectId: 'e-commerce-bd229',
    authDomain: 'e-commerce-bd229.firebaseapp.com',
    storageBucket: 'e-commerce-bd229.firebasestorage.app',
    measurementId: 'G-D03Y2GJPJY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtwWZuBHOGa48tyClJJPtazy7eiKS_CSg',
    appId: '1:916710267822:android:72633d71c3feb585da463f',
    messagingSenderId: '916710267822',
    projectId: 'e-commerce-bd229',
    storageBucket: 'e-commerce-bd229.firebasestorage.app',
  );
}
