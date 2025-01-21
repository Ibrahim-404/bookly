import 'package:flutter/material.dart';

class buaner extends StatelessWidget {
  buaner({
    super.key,
    required this.images,
    required this.ratio
  });
  String images;
  double ratio;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFFff502e),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage(images), fit: BoxFit.cover)),
        ),
      ),
    );
  }
}