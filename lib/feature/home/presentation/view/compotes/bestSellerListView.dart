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
        bloc: context.read<FetchNewestBooksCubit>(),
        builder: (context, state) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (state is FetchNewestBooksLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchNewestBooksSuccess) {
                  final book = state.books.items![index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.bookDetails);
                      },
                      child: Best_Seller(
                        imageLink: book.volumeInfo?.imageLinks.thumbnail??"",
                        bookName: book.volumeInfo?.title.toString()??"N/A",
                        authorName: book.volumeInfo?.authors?.first.toString()??"N/A",
                        // price: book.saleInfo!.listPrice?.amount.toString()??"N/A",
                        rate: book.volumeInfo?.averageRating.toString()??"N/A",
                        viewing: book.volumeInfo?.averageRating.toString()??"N/A",
                      ),
                    ),
                  );
                } else if (state is FetchNewestBooksFailure) {
                  return Center(child: Text(state.message));
                } else {
                  return Text("opps something went wrong!!..😒");
                }
              },
              childCount: state is FetchNewestBooksSuccess ? state.books.items!.length : 10, // Number of items
            ),
          );
        });
  }
}
