import 'dart:convert';
import 'package:flutter_demo/widgets/castModal.dart';
import 'package:http/http.dart' as http;

class CastService {
  Future<List<Cast>> fetchCast(id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=a02b554a4e49b91ac6a4c035a8a8abb2&language=en-US'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      return (List<Cast>.from(
          responseJson["cast"].map((x) => Cast.fromJson(x))));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
