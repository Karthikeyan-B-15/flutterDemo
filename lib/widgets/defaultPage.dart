import 'package:flutter/material.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key, required this.data});
  final String data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(data),
        centerTitle: true,
      ),
      body: ,
    );
  }
}
