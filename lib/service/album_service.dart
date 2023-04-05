import 'dart:convert';

import '../widgets/album.dart';
import 'package:http/http.dart' as http;
class AlbumService {


  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200) {
      print(Album.fromJson(jsonDecode(response.body)));
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
