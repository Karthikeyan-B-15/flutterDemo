import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/movieModal.dart';

import 'description.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget(
      {super.key,
      required this.length,
      required this.movieListData,
      required this.title,
      required this.cardHeight,
      required this.listWidgetHeight,
      required this.widthRatio,
      required this.cardType});
  final int? length;
  final List<Movie>? movieListData;
  final String title;
  final double cardHeight;
  final double listWidgetHeight;
  final double widthRatio;
  final String cardType;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Color(0xffffffff),
              fontWeight: FontWeight.bold,
              fontSize: 26),
        ),
        SizedBox(
          height: listWidgetHeight,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: length,
              itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  bannerUrl:
                                      'https://image.tmdb.org/t/p/w500${movieListData![index].backdropImage}',
                                  posterUrl:
                                      'https://image.tmdb.org/t/p/w500${movieListData![index].posterImage}',
                                  ratings:
                                      movieListData![index].ratings.toDouble(),
                                  storyLine: movieListData![index]
                                      .storyLine
                                      .toString(),
                                  releaseDate: movieListData![index]
                                      .releaseDate
                                      .toString(),
                                  title: movieListData![index].title.toString(),
                                  id: movieListData![index].id)));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: cardHeight,
                          width: width / widthRatio,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(cardType == 'banner-card'
                                      ? 'https://image.tmdb.org/t/p/w500${movieListData![index].backdropImage}'
                                      : 'https://image.tmdb.org/t/p/w500${movieListData![index].posterImage}'),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.only(right: 10),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: width / widthRatio,
                          child: Text(
                            title == 'TV Discover'
                                ? movieListData![index].originalName.toString()
                                : movieListData![index]
                                    .originalTitle
                                    .toString(),
                            softWrap: true,
                            style: const TextStyle(color: Color(0xffffffff)),
                          ),
                        ),
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}
