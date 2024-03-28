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
    apiKey: 'AIzaSyCh7QT64HAYCleL8FOUZ88YXF-aijBdLLE',
    appId: '1:877257909911:web:3f1aa7fbb9aac5a9c5abd2',
    messagingSenderId: '877257909911',
    projectId: 'we-solve-it-out',
    authDomain: 'we-solve-it-out.firebaseapp.com',
    storageBucket: 'we-solve-it-out.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA_RzzTdP6KJ5AVy73FGCqznpHe-H0C3I',
    appId: '1:877257909911:android:e3f481b87a65f81ec5abd2',
    messagingSenderId: '877257909911',
    projectId: 'we-solve-it-out',
    storageBucket: 'we-solve-it-out.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSMtC9ZNOpFsASzXYPLVMTzx7r8IayV2E',
    appId: '1:877257909911:ios:baf19f2e47f6081bc5abd2',
    messagingSenderId: '877257909911',
    projectId: 'we-solve-it-out',
    storageBucket: 'we-solve-it-out.appspot.com',
    androidClientId: '877257909911-48qursp6pegenjmiu8c3j6s3hdn1mavp.apps.googleusercontent.com',
    iosClientId: '877257909911-p99ncpssfo6bv0gqtu4he2qbkfpb8f0d.apps.googleusercontent.com',
    iosBundleId: 'com.example.cwtEcommerceApp',
  );
}