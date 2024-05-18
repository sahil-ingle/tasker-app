import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasker/auth/register_or_login.dart';
import 'package:tasker/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context, snapshot){
          if (snapshot.hasData){
            return HomePage();
          }else{
            return const RegisterORLogin();
          }
         }
         ),
    );
  }
}

