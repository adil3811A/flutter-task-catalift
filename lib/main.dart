import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/education_detail_screen.dart';
import 'package:flutter_task_catalift/login_screen.dart';

import 'firebase_options.dart';
// await Firebase.initializeApp(
// options: DefaultFirebaseOptions.currentPlatform,
// );
// web       1:658116732531:web:3f69b6beae05a5d0472c06
// android   1:658116732531:android:42bfa4db852b1e62472c06
// ios       1:658116732531:ios:69cbfc476f83ccc7472c06
// macos     1:658116732531:ios:69cbfc476f83ccc7472c06
// windows   1:658116732531:web:0f25759147effb4c472c06
final textstyle = TextStyle(fontSize: 50);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       primaryColor: Color(0xFF03045e),
        canvasColor:  Color(0xFFfafafa)
      ),
      home: FutureBuilder(
      future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      builder: (context, snapshot) {
        switch(snapshot.connectionState){
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if(user != null){
              return EducationDetailScreen();
            }else{
              return LoginScreen();
            }
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
        ),
    );
  }
}
