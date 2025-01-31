import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:bookly/feature/home/presentation/view/compotes/coustom_App_Bar_Book_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookDetails extends StatelessWidget {
  final Item? fetchItems;

  BookDetails({super.key, required this.fetchItems});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomAppBarBookDetails(),
                    AspectRatio(
                      aspectRatio: 150 / 192,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              fetchItems?.volumeInfo?.imageLinks.thumbnail ??
                                  '',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      fetchItems?.volumeInfo?.title ?? "No Title",
                      style: AppStyle.rgular30,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      fetchItems?.volumeInfo?.authors?.join(", ") ??
                          "Unknown Author",
                      style: AppStyle.rgular14,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SizedBox(
                      width: screenWidth * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            FontAwesomeIcons.star,
                            color: Colors.yellow,
                            size: screenWidth * 0.04,
                          ),
                          Text(
                            fetchItems?.volumeInfo?.averageRating?.toString() ??
                                "N/A",
                            style: AppStyle.rgular16,
                          ),
                          Text(
                            fetchItems?.volumeInfo?.ratingsCount?.toString() ??
                                "N/A",
                            style: AppStyle.rgular14,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Free",
                              style: AppStyle.rgular16
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: screenHeight * 0.06,
                          width: screenWidth * 0.4,
                          decoration: BoxDecoration(
                            color: Color(0xFFEF8262),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Free preview",
                              style: AppStyle.rgular14
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    Container(
                      alignment: Alignment.centerLeft,
                      child:
                          Text("You can also like", style: AppStyle.rgular16),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
