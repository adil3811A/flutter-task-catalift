

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_catalift/education_detail_screen.dart';
import 'package:flutter_task_catalift/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges()
    .listen((user) {
      if(user!=null){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => EducationDetailScreen(),));
      }
    },);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 100 , right: 20 , left: 20, bottom: 20),
        child: Column(
          children: [
            LinearProgressIndicator(value: 0.2,),
            Expanded(
              child: Center(
                child:OutlinedButton(
                    onPressed: () async{
                      final credential =await signInWithGoogle();
                      print("this is Cededential $credential");
                    },
                    child:Container(
                      width: 500,
                      height: 150,
                      child: Row(
                        children: [
                          Image.asset('assets/images/google_logo.png'),
                          Text('Login With Google', style: TextStyle(fontSize: 12),)
                        ],
                      ),
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}