import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Description extends StatelessWidget {
  const Description({super.key, required this.bannerUrl});
  final String bannerUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: SingleChildScrollView(
            child: Stack(
          children: [
            Positioned(
              child: ClipPath(
                clipper: CutomClipperPath(),
                child: Image.network(
                  bannerUrl,
                  height: 500,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
                top: 60,
                left: 30,
                child: Text(
                  'hi',
                  style: TextStyle(color: Colors.amber),
                ))
          ],
        )),
      ),
    );
  }
}

class CutomClipperPath extends CustomClipper<Path> {
  var radius = 5.0;
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
