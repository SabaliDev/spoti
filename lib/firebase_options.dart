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
    apiKey: 'AIzaSyACp1yd8o3sXco_3Sh1IIDmiFudhnCuZks',
    appId: '1:445747090047:web:b07019a5309c976836654a',
    messagingSenderId: '445747090047',
    projectId: 'spoti-a4989',
    authDomain: 'spoti-a4989.firebaseapp.com',
    storageBucket: 'spoti-a4989.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbFTQblexnlIO-n7A-Y9YBFogNqa-C7zk',
    appId: '1:445747090047:android:04eac1a2c3cf426b36654a',
    messagingSenderId: '445747090047',
    projectId: 'spoti-a4989',
    storageBucket: 'spoti-a4989.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgg1He3Ady9WLra617n4VtSC1U8MZwrU8',
    appId: '1:445747090047:ios:efe9a99bfcd9166b36654a',
    messagingSenderId: '445747090047',
    projectId: 'spoti-a4989',
    storageBucket: 'spoti-a4989.appspot.com',
    iosBundleId: 'com.example.spoti',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgg1He3Ady9WLra617n4VtSC1U8MZwrU8',
    appId: '1:445747090047:ios:efe9a99bfcd9166b36654a',
    messagingSenderId: '445747090047',
    projectId: 'spoti-a4989',
    storageBucket: 'spoti-a4989.appspot.com',
    iosBundleId: 'com.example.spoti',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyACp1yd8o3sXco_3Sh1IIDmiFudhnCuZks',
    appId: '1:445747090047:web:82e9d186d54571b936654a',
    messagingSenderId: '445747090047',
    projectId: 'spoti-a4989',
    authDomain: 'spoti-a4989.firebaseapp.com',
    storageBucket: 'spoti-a4989.appspot.com',
  );
}
