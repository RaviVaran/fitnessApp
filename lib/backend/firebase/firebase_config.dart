import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC7FS3A-O1ygZ_vgiisg3olkSL0sPkq_WQ",
            authDomain: "workout-app-d3e7a.firebaseapp.com",
            projectId: "workout-app-d3e7a",
            storageBucket: "workout-app-d3e7a.appspot.com",
            messagingSenderId: "332103938029",
            appId: "1:332103938029:web:55f3f434c15e7c4f2141e4",
            measurementId: "G-PFJ3V6GJVR"));
  } else {
    await Firebase.initializeApp();
  }
}
