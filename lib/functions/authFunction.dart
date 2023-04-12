import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

signup(
    String email , String password ) async {
  try {
    print(email + password);

    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('success');
    // credential.user.;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}
