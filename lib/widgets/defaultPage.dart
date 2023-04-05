import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/service/album_service.dart';
import 'package:flutter_demo/widgets/album.dart';
import 'package:http/http.dart' as http;

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key, required this.data});
  final String data;

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  late Future<Album> futureAlbum;
  late Album albumData;
  @override
  void initState() {
    super.initState();
    futureAlbum = AlbumService().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(widget.data),
        centerTitle: true,
      ),
      body: FutureBuilder<Album>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
