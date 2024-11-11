
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab9/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyD_1fqXPeZtdooIJJH9B0y-_-ZZQPYNBl4",
        appId: "1:1046931687897:android:2ad7be32ad5d6e3b9031c8",
        messagingSenderId: "1046931687897",
        projectId: "lab9-2d0bc"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            title: 'Flutter Firebase EMail Password Auth',
            theme: ThemeData(
              primarySwatch: Colors.deepPurple,
            ),
            debugShowCheckedModeBanner: false,
            home: Login(),
          );
        });
  }
}
