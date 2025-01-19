import 'package:bookly/feature/home/presentation/view/compotes/bestSellerListView.dart';
import 'package:bookly/feature/home/presentation/view/compotes/build_buaner.dart';
import 'package:bookly/feature/home/presentation/view/compotes/custom_app_bar.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarApplication(),
            const SizedBox(
              height: 8,
            ),
            BuildBuaner(),
            SizedBox(height: 5,),
            const Text(
              "Best Seller",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            BestSellerListView(),
          ],
        ),
      ),
    ));
  }
}

