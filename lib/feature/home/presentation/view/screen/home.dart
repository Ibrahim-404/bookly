import 'package:bookly/core/constraint/assetsImageConst.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Image.asset(
                  "${assetsImagesConst.logo}",
                  width: 75,
                  height: 50,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 35,
                    ))
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: 500,
                  scrollDirection: Axis.horizontal,
                  animateToClosest: true),
              items: assetsImagesConst.HighlightImages.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return BooklyHead(
                      imageIndex: assetsImagesConst.HighlightImages.indexOf(i),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Best Seller",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            BookDetails(),
          ],
        ),
      ),
    );
  }
}

class BooklyHead extends StatelessWidget {
  final int imageIndex;
  const BooklyHead({super.key, required this.imageIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      height: 193,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("${assetsImagesConst.HighlightImages[imageIndex]}"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BookDetails extends StatelessWidget {
  // final String image;
  // final  String bookName;
  // final String auther;
  // final double price;
  // final int rating;
  const BookDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
    Column(
      mainAxisAlignment:MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(assetsImagesConst.book,width: 70,height: 105,),

      ]
    ),
            Container(
      height: 51,
      width: 193,
      child: const Text(
        "Harry Potterand the Goblet of Fire",
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          overflow: TextOverflow.clip,
        ),
      ),
    ),
    Container(
      child: const Text(
        "J.K. Rowling",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "19.99 €",
          style: TextStyle(fontSize: 15),
        ),
      ],
    )
          ],
        );
  }
}
