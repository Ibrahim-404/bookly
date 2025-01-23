import 'package:bookly/core/utils/constraint/routes_name.dart';
import 'package:bookly/feature/home/presentation/view/compotes/best_seller.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.bookDetails);
              },
              child: Best_Seller(
                imageLink: "assets/picture_file/Book 1 Hightligh.png",
                bookName: "Harry Potter and the Goblet of Fire",
                authorName: "J.K. Rowling",
                price: "19.99",
                rate: "4.5",
                viewing: "2390",
              ),
            ),
          );
        },
        childCount: 10, // Number of items
      ),
    );
  }
}