import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInwithEmailPassword(String email, password) async{
    try{
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

Future<UserCredential> signUpwithEmailPassword(String email, password) async{
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }

}