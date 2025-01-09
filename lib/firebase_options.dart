import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDBIUoSTdMXm4-SARTTs8qkpSeQB7peNk8',
    appId: '1:219891135896:web:baeac86500986a0fdde7ed',
    messagingSenderId: '219891135896',
    projectId: 'tama-firebase-92199',
    authDomain: 'tama-firebase-92199.firebaseapp.com',
    storageBucket: 'tama-firebase-92199.firebasestorage.app',
    measurementId: 'G-VZ58KW2M0P',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJOAW5qj9bPsPJ1l6i_5Q-rmyMQJM7roU',
    appId: '1:219891135896:android:c5c33214b33f9e2fdde7ed',
    messagingSenderId: '219891135896',
    projectId: 'tama-firebase-92199',
    storageBucket: 'tama-firebase-92199.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAglLXtP3XBvnhxo0GYyrWiI0amNrKuM_M',
    appId: '1:219891135896:ios:6c8bb35e1193b489dde7ed',
    messagingSenderId: '219891135896',
    projectId: 'tama-firebase-92199',
    storageBucket: 'tama-firebase-92199.firebasestorage.app',
    iosBundleId: 'com.example.tamaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAglLXtP3XBvnhxo0GYyrWiI0amNrKuM_M',
    appId: '1:219891135896:ios:6c8bb35e1193b489dde7ed',
    messagingSenderId: '219891135896',
    projectId: 'tama-firebase-92199',
    storageBucket: 'tama-firebase-92199.firebasestorage.app',
    iosBundleId: 'com.example.tamaApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDBIUoSTdMXm4-SARTTs8qkpSeQB7peNk8',
    appId: '1:219891135896:web:245e77cf79c7bc05dde7ed',
    messagingSenderId: '219891135896',
    projectId: 'tama-firebase-92199',
    authDomain: 'tama-firebase-92199.firebaseapp.com',
    storageBucket: 'tama-firebase-92199.firebasestorage.app',
    measurementId: 'G-65FTKPBD9C',
  );

}