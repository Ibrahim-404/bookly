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
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: AppbarApplication(),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(height: 8),
              ),
              SliverToBoxAdapter(
                child: BuildBuaner(
                  ratio: 0.7,
                  listOfImages:[
                  "assets/picture_file/Book 1 Hightligh.png",
                  "assets/picture_file/Book 1 Hightligh.png",
                  "assets/picture_file/Book 1 Hightligh.png"
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: const Text(
                    "Best Seller",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // Use BestSellerListView directly as a sliver
              BestSellerListView(), // This is now a sliver
            ],
          ),
        ),
      ),
    );
  }
}