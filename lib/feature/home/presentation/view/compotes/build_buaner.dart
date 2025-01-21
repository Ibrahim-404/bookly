import 'package:bookly/feature/home/presentation/view/compotes/buaner.dart';
import 'package:flutter/material.dart';

class BuildBuaner extends StatelessWidget {
  final List<String> listOfImages;
  final double ratio;
  double? itemHeight;
  BuildBuaner(
      {super.key,
      required this.listOfImages,
      required this.ratio,
      thisitemHeight});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight ?? 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listOfImages.length,
          itemBuilder: (context, index) {
            return buaner(images: listOfImages[index], ratio: ratio);
          }),
    );
  }
}
