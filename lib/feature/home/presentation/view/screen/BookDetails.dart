import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:bookly/feature/home/presentation/view/compotes/build_buaner.dart';
import 'package:bookly/feature/home/presentation/view/compotes/coustom_App_Bar_Book_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bookdetails extends StatelessWidget {
  Bookdetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
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
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: AspectRatio(
                      aspectRatio: 150 / 192,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                "assets/picture_file/Book 1 Hightligh.png"),
                            fit: BoxFit.cover
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: screenHeight * 0.04),
                  Text("The Jungle Book", style: AppStyle.rgular30),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Rudyard Kipling",
                    style: AppStyle.rgular14,
                  ),
                  SizedBox(height: screenHeight * 0.03),
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
                          "4.8",
                          style: AppStyle.rgular16,
                        ),
                        Text(
                          "(2390)",
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
                              "19.99€",
                              style:
                                  AppStyle.rgular16.copyWith(color: Colors.black),
                            ),
                          )),
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
                            style: AppStyle.rgular14.copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("You can also like", style: AppStyle.rgular16),
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
