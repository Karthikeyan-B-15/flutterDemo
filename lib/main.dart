import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/homePage.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My app', // used by the OS task switcher
      home: SafeArea(
        child: HomePage(),
      ),
    ),
  );
}
