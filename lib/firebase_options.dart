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
    apiKey: 'AIzaSyAXXDYPrzA96ZDDMZo3DVUOUNS5DuffCCY',
    appId: '1:267296888236:web:b9ffcffcec8d87ed831609',
    messagingSenderId: '267296888236',
    projectId: 'let-s-chat-4626c',
    authDomain: 'let-s-chat-4626c.firebaseapp.com',
    storageBucket: 'let-s-chat-4626c.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHpACVE14Tqey94iBa7EMawmdhuuBfLgY',
    appId: '1:267296888236:android:a13c4cc1fcb48e33831609',
    messagingSenderId: '267296888236',
    projectId: 'let-s-chat-4626c',
    storageBucket: 'let-s-chat-4626c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7D5fObRARSYvTTvJzYjxJMOOawgFUEGI',
    appId: '1:267296888236:ios:ee917153a99e3803831609',
    messagingSenderId: '267296888236',
    projectId: 'let-s-chat-4626c',
    storageBucket: 'let-s-chat-4626c.firebasestorage.app',
    iosBundleId: 'com.example.priya',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7D5fObRARSYvTTvJzYjxJMOOawgFUEGI',
    appId: '1:267296888236:ios:ee917153a99e3803831609',
    messagingSenderId: '267296888236',
    projectId: 'let-s-chat-4626c',
    storageBucket: 'let-s-chat-4626c.firebasestorage.app',
    iosBundleId: 'com.example.priya',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAXXDYPrzA96ZDDMZo3DVUOUNS5DuffCCY',
    appId: '1:267296888236:web:68b086d79368fc04831609',
    messagingSenderId: '267296888236',
    projectId: 'let-s-chat-4626c',
    authDomain: 'let-s-chat-4626c.firebaseapp.com',
    storageBucket: 'let-s-chat-4626c.firebasestorage.app',
  );
}
