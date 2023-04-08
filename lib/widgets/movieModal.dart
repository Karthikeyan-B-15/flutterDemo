class Movie {
  final int id;
  final String? title;
  final String posterImage;
  final String? originalName;
  final String? originalTitle;
  final String? backdropImage;

  const Movie(
      {required this.id,
      required this.title,
      required this.posterImage,
      required this.originalName,
      required this.originalTitle,
      required this.backdropImage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        posterImage: json['poster_path'],
        originalName: json['original_name'],
        originalTitle: json['original_title'],
        backdropImage: json['backdrop_path']);
  }
}
