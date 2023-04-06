import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<String> topics = ['Mask images'];
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) => Text(topics[index]),
      ),
    );
  }
}
