import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/service/castService.dart';
import 'package:flutter_demo/widgets/castModal.dart';

class Description extends StatefulWidget {
  const Description({
    super.key,
    required this.bannerUrl,
    required this.posterUrl,
    required this.ratings,
    required this.releaseDate,
    required this.storyLine,
    required this.title,
    required this.id,
  });
  final String bannerUrl;
  final String posterUrl;
  final double ratings;
  final String storyLine;
  final String releaseDate;
  final String title;
  final int id;

  @override
  State<Description> createState() => _DescriptionState(id: id);
}

class _DescriptionState extends State<Description> {
  late Future<List<Cast>> castFuture;
  _DescriptionState({
    required this.id,
  });
  final int id;
  @override
  void initState() {
    super.initState();

    castFuture = CastService().fetchCast(id);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black87,
          child: SingleChildScrollView(
              child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                      child: SizedBox(
                    height: 390,
                  )),
                  Positioned(
                    child: ClipPath(
                      clipper: CutomClipperPath(),
                      child: Image.network(
                        widget.bannerUrl,
                        height: 370,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: Container(
                      height: 180,
                      width: 130,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.posterUrl),
                              fit: BoxFit.cover),
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.only(right: 10),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.ratings.toString(),
                      style: TextStyle(color: Colors.purple, fontSize: 36),
                    ),
                    SizedBox(height: 8),
                    StarRating(
                      rating: widget.ratings,
                      color: Colors.purple,
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.releaseDate,
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Story Line',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(widget.storyLine,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Actors',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder<List<Cast>>(
                        future: castFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return SizedBox(
                              height: 300,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 220,
                                            width: width / 2.5,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(snapshot
                                                                .data![index]
                                                                .profileImage !=
                                                            null
                                                        ? 'https://image.tmdb.org/t/p/w500' +
                                                            snapshot
                                                                .data![index]
                                                                .profileImage
                                                                .toString()
                                                        : 'https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg'),
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
                                              snapshot.data![index].name
                                                  .toString(),
                                              softWrap: true,
                                              style: TextStyle(
                                                  color: Color(0xffffffff)),
                                            ),
                                          ),
                                        ],
                                      )),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ],
                ),
              ),
            ],
          ))),
    );
  }
}

class CutomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  StarRating({this.starCount = 10, this.rating = .0, required this.color});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        size: 22,
        color: Colors.purple,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: 22,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: 22,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
        children:
            new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
