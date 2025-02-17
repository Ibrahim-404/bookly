import 'package:bookly/core/utils/constraint/routes_name.dart';
import 'package:bookly/feature/home/presentation/manage/fetch_newest_books_cubit.dart';
import 'package:bookly/feature/home/presentation/view/compotes/best_seller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksLoading) {
          // Show a loading indicator while loading
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is FetchNewestBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final book = state.books.items![index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        RoutesName.bookDetails,
                        arguments: book,
                      );
                      print("Navigating to BookDetails with book: $book");
                    },
                    child: Best_Seller(
                      imageLink: book.volumeInfo?.imageLinks.thumbnail ?? "",
                      bookName: book.volumeInfo?.title.toString() ?? "N/A",
                      authorName:
                          book.volumeInfo?.authors?.first.toString() ?? "N/A",
                      rate: book.volumeInfo?.averageRating.toString() ?? "N/A",
                      viewing:
                          book.volumeInfo?.averageRating.toString() ?? "N/A",
                    ),
                  ),
                );
              },
              childCount: state.books.items!.length,
            ),
          );
        } else if (state is FetchNewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.message)),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: Text("Oops, something went wrong! 😒")),
          );
        }
      },
    );
  }
}
