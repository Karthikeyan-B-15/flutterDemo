import 'dart:ffi';

class Movie {
  final int id;
  final String? title;
  final String posterImage;
  final String? originalName;
  final String? originalTitle;
  final String? backdropImage;
  final String? storyLine;
  final String? releaseDate;
  final ratings;

  const Movie(
      {required this.id,
      required this.title,
      required this.posterImage,
      required this.originalName,
      required this.originalTitle,
      required this.backdropImage,
      required this.storyLine,
      required this.releaseDate,
      required this.ratings});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        posterImage: json['poster_path'],
        originalName: json['original_name'],
        originalTitle: json['original_title'],
        backdropImage: json['backdrop_path'],
        storyLine: json['overview'],
        releaseDate: json['release_date'],
        ratings: json['vote_average']);
  }
}
