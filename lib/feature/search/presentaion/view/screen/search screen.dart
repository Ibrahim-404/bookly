import 'package:bookly/feature/home/presentation/view/compotes/best_seller.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: Icon(Icons.search),
                    hintText: "Search",
                  ),
                ),
              ),
              // Place the SliverList directly in the CustomScrollView
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) => Best_Seller(
                    imageLink: "assets/picture_file/Book 1 Hightligh.png",
                    bookName: "Harry Potter and the Goblet of Fire",
                    authorName: "J.K. Rowling",
                    // price: "19.99",
                    rate: "4.5",
                    viewing: "2390",
                  ),
                  childCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}