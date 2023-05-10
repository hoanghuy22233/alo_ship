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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRLGrPMlaPQ9Bw9gD7kf6jFVgHsatx3JU',
    appId: '1:16653490472:android:ad4f1b7f44235f4bcf181d',
    messagingSenderId: '16653490472',
    projectId: 'aloship-2aa42',
    storageBucket: 'aloship-2aa42.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCTN4hLmuFyK76q8yUZnYPsIL3N8URunxc',
    appId: '1:16653490472:ios:0660b29e1617bd1ecf181d',
    messagingSenderId: '16653490472',
    projectId: 'aloship-2aa42',
    storageBucket: 'aloship-2aa42.appspot.com',
    androidClientId: '16653490472-ci9t66k1u97lu5re9vpqa70mm4nueq85.apps.googleusercontent.com',
    iosClientId: '16653490472-jbjrjduclnq919gj9mlrd1bgvi56poj4.apps.googleusercontent.com',
    iosBundleId: 'com.app.aloship99',
  );
}
