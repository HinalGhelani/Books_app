import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthHelper {
  FirebaseAuthHelper._();

  static final FirebaseAuthHelper firebaseAuthHelper = FirebaseAuthHelper._();
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();

  // TODO: Anonymously

  Future<Map<String, dynamic>> logInWithAnonymously() async {
    Map<String, dynamic> res = {};

    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();

      User? user = userCredential.user;

      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          res['error'] = "Sign in method is disabled";
          break;
      }
    }
    return res;
  }

  // TODO: googleSignIn

  Future<Map<String, dynamic>> signInWithGoogle() async {
    Map<String, dynamic> res = {};

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      User? user = userCredential.user;
      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          res['error'] = "Sign in method is disabled";
          break;
      }
    }
    return res;
  }

// TODO: Sign Up
  Future<Map<String, dynamic>> signUp(
      {required String email, required String password}) async {
    Map<String, dynamic> res = {};

    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      print("================================");
      print(e.code);
      print("================================");

      switch (e.code) {
        case "week-password":
          res['error'] = "password must be lengthy";
          break;
        case "operation-not-allowed":
          res['error'] = "Sign up method is disabled";
          break;
        case "email-already-in-use":
          res['error'] = "This user already exists";
          break;
      }
    }
    return res;
  }

// TODO: Sign In

  Future<Map<String, dynamic>> signIn(
      {required String email, required String password}) async {
    Map<String, dynamic> res = {};

    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      res['user'] = user;
    } on FirebaseAuthException catch (e) {
      print("==================================");
      print(e.code);
      print("==================================");

      switch (e.code) {
        case "wrong-password":
          res['error'] = "password is wrong....";
          break;
        case "operation-not-allowed":
          res['error'] = "Sign in method is disabled....";
          break;
        case "user-disabled":
          res['error'] = "You are blocked....";
          break;
      }
    }
    return res;
  }
}
