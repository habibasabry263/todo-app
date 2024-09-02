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
    apiKey: 'AIzaSyDbrHnQjs1T0DDJZDJJ-SlP8AKv9Of0zmY',
    appId: '1:79841091852:web:20ffe3732320f6a10e6929',
    messagingSenderId: '79841091852',
    projectId: 'todo-869e2',
    authDomain: 'todo-869e2.firebaseapp.com',
    storageBucket: 'todo-869e2.appspot.com',
    measurementId: 'G-3NVWW7Y507',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCH0yC9aJyBoPyKB459SHPjWhL1nlc1Emo',
    appId: '1:79841091852:android:79feaef4bd7b59710e6929',
    messagingSenderId: '79841091852',
    projectId: 'todo-869e2',
    storageBucket: 'todo-869e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7x4Epnq__xywq2P4oUxE-vnR2ZWiSXI0',
    appId: '1:79841091852:ios:3ffc809a322547cc0e6929',
    messagingSenderId: '79841091852',
    projectId: 'todo-869e2',
    storageBucket: 'todo-869e2.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7x4Epnq__xywq2P4oUxE-vnR2ZWiSXI0',
    appId: '1:79841091852:ios:3ffc809a322547cc0e6929',
    messagingSenderId: '79841091852',
    projectId: 'todo-869e2',
    storageBucket: 'todo-869e2.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDbrHnQjs1T0DDJZDJJ-SlP8AKv9Of0zmY',
    appId: '1:79841091852:web:127f621db89431d80e6929',
    messagingSenderId: '79841091852',
    projectId: 'todo-869e2',
    authDomain: 'todo-869e2.firebaseapp.com',
    storageBucket: 'todo-869e2.appspot.com',
    measurementId: 'G-2K45N45FK5',
  );
}
