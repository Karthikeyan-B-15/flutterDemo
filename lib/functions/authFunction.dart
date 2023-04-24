import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/homePage.dart';

signup(String email, String password, String name) async {
  try {
    print(email + password);

    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print('success');
    credential.user?.updateDisplayName(name);
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

signIn(String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (context.mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      const snackbar = SnackBar(content: Text('No user found for that email.'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      const snackbar =
          SnackBar(content: Text('Wrong password provided for that user.'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  } catch (e) {
    print('Wrong password provided for that user.');
    const snackbar =
        SnackBar(content: Text('Wrong password provided for that user.'));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
