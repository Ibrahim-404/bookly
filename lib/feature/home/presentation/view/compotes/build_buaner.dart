import 'package:flutter/material.dart';
Widget BuildBuaner() {
  List<String> images = [
    "assets/picture_file/Book 1 Hightligh.png",
    "assets/picture_file/Book 1 Hightligh.png",
    "assets/picture_file/Book 1 Hightligh.png" 
  ];
  return SizedBox(
    height: 200,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: AspectRatio(
              aspectRatio: 0.7,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFff502e),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: AssetImage(images[index]), fit: BoxFit.cover)),
              ),
            ),
          );
        }),
  );
}