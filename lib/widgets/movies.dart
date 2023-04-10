import 'package:flutter/material.dart';
import 'package:flutter_demo/service/movieService.dart';
import 'package:flutter_demo/widgets/description.dart';
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
              Text(
                'Movie Discover',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              SizedBox(height: 10),
              FutureBuilder<List<Movie>>(
                  future: futureMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 220,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Description(
                                                bannerUrl:
                                                    'https://image.tmdb.org/t/p/w500' +
                                                        snapshot.data![index]
                                                            .backdropImage
                                                            .toString(),
                                                posterUrl:
                                                    'https://image.tmdb.org/t/p/w500' +
                                                        snapshot.data![index]
                                                            .posterImage
                                                            .toString(),
                                                ratings: snapshot
                                                    .data![index].ratings
                                                    .toDouble(),
                                                storyLine: snapshot
                                                    .data![index].storyLine
                                                    .toString(),
                                                releaseDate: snapshot
                                                    .data![index].releaseDate
                                                    .toString(),
                                                title: snapshot.data![index].title.toString(),
                                                id: snapshot.data![index].id)));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 170,
                                        width: width / 1.5,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'https://image.tmdb.org/t/p/w500' +
                                                        snapshot.data![index]
                                                            .backdropImage
                                                            .toString()),
                                                fit: BoxFit.cover),
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        margin: EdgeInsets.only(right: 10),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: width / 2.5,
                                        child: Text(
                                          snapshot.data![index].originalTitle
                                              .toString(),
                                          softWrap: true,
                                          style: TextStyle(
                                              color: Color(0xffffffff)),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              Text(
                'Trending Movies',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              SizedBox(height: 10),
              FutureBuilder<List<Movie>>(
                  future: futureTrendingMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 220,
                                      width: width / 2.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500' +
                                                      snapshot.data![index]
                                                          .posterImage),
                                              fit: BoxFit.cover),
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: EdgeInsets.only(right: 10),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: width / 2.5,
                                      child: Text(
                                        snapshot.data![index].title.toString(),
                                        softWrap: true,
                                        // overflow: TextOverflow.ellipsis,
                                        style:
                                            TextStyle(color: Color(0xffffffff)),
                                      ),
                                    ),
                                  ],
                                )),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
              Text(
                'TV Discover',
                style: TextStyle(
                    color: Color(0xffffffff),
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              SizedBox(height: 10),
              FutureBuilder<List<Movie>>(
                  future: futureTVMovie,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 300,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 220,
                                      width: width / 2.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  'https://image.tmdb.org/t/p/w500' +
                                                      snapshot.data![index]
                                                          .posterImage),
                                              fit: BoxFit.cover),
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: EdgeInsets.only(right: 10),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: width / 2.5,
                                      child: Text(
                                        snapshot.data![index].originalName
                                            .toString(),
                                        softWrap: true,
                                        style:
                                            TextStyle(color: Color(0xffffffff)),
                                      ),
                                    ),
                                  ],
                                )),
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
