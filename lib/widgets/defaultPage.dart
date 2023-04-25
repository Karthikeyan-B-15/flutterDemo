import 'package:flutter/material.dart';
import 'package:flutter_demo/service/album_service.dart';
import 'package:flutter_demo/widgets/album.dart';
import 'package:flutter_demo/widgets/counter_example.dart';
import 'package:flutter_demo/widgets/gallery.dart';
import 'package:flutter_demo/widgets/movies.dart';
import 'package:flutter_demo/widgets/textFieldDemo.dart';

import '../view/todo.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key, required this.data});
  final String data;
  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  late Future<Album> futureAlbum;
  @override
  void initState() {
    super.initState();
    futureAlbum = AlbumService().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    Widget renderWidget() {
      switch (widget.data) {
        case 'API':
          return FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.title);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          );
        case 'Images':
          return const Gallery();
        case 'Movies':
          return const Movies();
        case 'Text Fields':
          return const TextFieldDemo();
        case 'Counter':
          return const CounterExample();
        case 'TODO':
          return const TODO();
        default:
          return const Center(
            child: Text('Hi there'),
          );
      }
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xFFFFFFFF)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(widget.data),
          centerTitle: true,
          backgroundColor:
              widget.data == 'Movies' ? const Color(0xDD171717) : Colors.blue,
        ),
        body: renderWidget());
  }
}
