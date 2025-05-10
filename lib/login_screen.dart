

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
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => EducationDetailScreen()),(route) => false,);
      }
    },);
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50 , right: 20 , left: 20, bottom: 20),
        child: Column(
          children: [
            LinearProgressIndicator(value: 0.2,),
            Expanded(
              child: Center(
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                        onPressed: () async{
                          final credential =await signInWithGoogle();
                          print("this is Cededential $credential");
                        },
                        child:Container(
                          width: 300,
                          height: 100,
                          child: Row(
                            children: [
                              Image.asset('assets/images/google_logo.png'),
                              Text('Login With Google', style: TextStyle(fontSize: 12),)
                            ],
                          ),
                        )
                    ),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => EducationDetailScreen()));
                    }, child: Text('Login Letter'))
                  ],
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
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Ensure the user is signed out first to trigger account selection
  await googleSignIn.signOut();

  // Start the sign-in flow
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  // If sign-in was aborted
  if (googleUser == null) {
    throw Exception('Google sign-in aborted');
  }

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}
