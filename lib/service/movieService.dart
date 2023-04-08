import 'dart:convert';
import 'package:flutter_demo/widgets/movieModal.dart';
import '../widgets/album.dart';
import 'package:http/http.dart' as http;

class MovieService {
  Future<List<Movie>> fetchTrendingMovie() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/trending/all/day?api_key=a02b554a4e49b91ac6a4c035a8a8abb2'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);

      return (List<Movie>.from(
          responseJson["results"].map((x) => Movie.fromJson(x))));
    } else {
      throw Exception('Failed to load album');
    }
  }
 Future<List<Movie>> fetchTVMovie() async {
    final response = await  http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/tv?api_key=a02b554a4e49b91ac6a4c035a8a8abb2&language=en-US&sort_by=popularity.desc&page=1&timezone=America%2FNew_York&include_null_first_air_dates=false&with_watch_monetization_types=flatrate&with_status=0&with_type=0'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);

      return (List<Movie>.from(
          responseJson["results"].map((x) => Movie.fromJson(x))));
    } else {
      throw Exception('Failed to load album');
    }
  }
 Future<List<Movie>> fetchMovie() async {
    final response = await  http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=a02b554a4e49b91ac6a4c035a8a8abb2&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);

      return (List<Movie>.from(
          responseJson["results"].map((x) => Movie.fromJson(x))));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
