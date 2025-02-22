import 'package:bookly/feature/home/presentation/view/compotes/buildButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bookly/core/utils/constraint/appStyle.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:bookly/feature/home/presentation/manage/details/item_details_categories_cubit.dart';
import 'package:bookly/feature/home/presentation/view/compotes/coustom_App_Bar_Book_details.dart';
import 'package:bookly/feature/home/presentation/view/compotes/build_buaner.dart';

import '../../../../../core/utils/Function/launchUrl_parse.dart';
import '../compotes/CustomBookItem.dart';

class BookDetails extends StatefulWidget {
  final Item? fetchItems;

  BookDetails({super.key, required this.fetchItems});

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  void initState() {
    super.initState();
    context.read<ItemDetailsCategoriesCubit>().fetchSimilarBooks(
        category: widget.fetchItems?.volumeInfo?.categories?.first ?? "");
  }

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
              // Header & Image
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
                              widget.fetchItems?.volumeInfo?.imageLinks
                                      .thumbnail ??
                                  '',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      widget.fetchItems?.volumeInfo?.title ?? "No Title",
                      style: AppStyle.rgular30,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      widget.fetchItems?.volumeInfo?.authors?.join(", ") ??
                          "Unknown Author",
                      style: AppStyle.rgular14,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    SizedBox(
                      width: screenWidth * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(FontAwesomeIcons.star,
                              color: Colors.yellow, size: screenWidth * 0.04),
                          Text(
                              widget.fetchItems?.volumeInfo?.averageRating
                                      ?.toString() ??
                                  "N/A",
                              style: AppStyle.rgular16),
                          Text(
                              widget.fetchItems?.volumeInfo?.ratingsCount
                                      ?.toString() ??
                                  "N/A",
                              style: AppStyle.rgular14),
                        ],
                      ),
                    ),
                    // Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildButton("Free", Colors.white, Colors.black,
                            screenWidth, screenHeight, () {}),
                        buildButton(
                          widget.fetchItems?.volumeInfo?.previewLink == null
                              ? "not found"
                              : "Free preview",
                          Color(0xFFEF8262),
                          Colors.white,
                          screenWidth,
                          screenHeight,
                          () async {
                            if (widget.fetchItems?.volumeInfo?.previewLink ==
                                null) {
                              return;
                            } else {
                              await launchUrlCustom(
                                  widget.fetchItems?.volumeInfo?.previewLink);
                            }
                          },
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

              // Similar Books List
              BlocBuilder<ItemDetailsCategoriesCubit,
                  ItemDetailsCategoriesState>(
                builder: (context, state) {
                  if (state is ItemDetailsCategoriesLoading) {
                    return SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is ItemDetailsCategoriesSuccess) {
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.books.items!.length,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 0.7,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: CustomBookItem(
                                  images: state.books.items![index].volumeInfo!
                                      .imageLinks.thumbnail,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else if (state is ItemDetailsCategoriesFailure) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(state.message)),
                    );
                  } else {
                    return SliverToBoxAdapter(
                      child:
                          Center(child: Text("Oops! Something went wrong. 😒")),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
