import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/counter.dart';
import 'package:flutter_demo/widgets/homePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_demo/widgets/signInPage.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My app', // used by the OS task switcher
        home: SafeArea(
          child: HomePage(),
        ),
      ),
    ),
  );
}
