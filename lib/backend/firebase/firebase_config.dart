import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDjzMwqbx9D400FujKhyHY3cpSSnCGw-Uo",
            authDomain: "almacen-b6f67.firebaseapp.com",
            projectId: "almacen-b6f67",
            storageBucket: "almacen-b6f67.firebasestorage.app",
            messagingSenderId: "430704273900",
            appId: "1:430704273900:web:11ea04816cfd1f8c2138c9",
            measurementId: "G-MMWXP79CF4"));
  } else {
    await Firebase.initializeApp();
  }
}
