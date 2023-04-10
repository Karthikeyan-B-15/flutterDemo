import 'package:flutter/material.dart';
import 'package:flutter_demo/service/movieService.dart';
import 'package:flutter_demo/widgets/description.dart';
import 'package:flutter_demo/widgets/movieListWidget.dart';
import 'package:flutter_demo/widgets/movieModal.dart';

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  late Future<List<Movie>> futureMovie;
  late Future<List<Movie>> futureTrendingMovie;
  late Future<List<Movie>> futureTVMovie;
  @override
  void initState() {
    super.initState();
    futureMovie = MovieService().fetchMovie();
    futureTrendingMovie = MovieService().fetchTrendingMovie();
    futureTVMovie = MovieService().fetchTVMovie();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              FutureBuilder<List<Movie>>(
                  future: futureMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MovieListWidget(
                        length: snapshot.data?.length,
                        movieListData: snapshot.data,
                        title: 'Movie Discover',
                        cardHeight: 170,
                        listWidgetHeight: 220,
                        widthRatio: 1.5,
                        cardType: 'banner-card',
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 10),
              FutureBuilder<List<Movie>>(
                  future: futureTrendingMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MovieListWidget(
                        length: snapshot.data?.length,
                        movieListData: snapshot.data,
                        title: 'Trending Movies',
                        widthRatio: 2.5,
                        cardHeight: 220,
                        listWidgetHeight: 300,
                        cardType: '',
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
             const SizedBox(height: 10),
              FutureBuilder<List<Movie>>(
                  future: futureTVMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MovieListWidget(
                        length: snapshot.data?.length,
                        movieListData: snapshot.data,
                        title: 'TV Discover',
                        widthRatio: 2.5,
                        cardHeight: 220,
                        listWidgetHeight: 300,
                        cardType: '',
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
