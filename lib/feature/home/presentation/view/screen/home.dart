import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/feature/home/data/repo/home_services_imple.dart';
import 'package:bookly/feature/home/presentation/manage/fetch_feature_books_cubit.dart';
import 'package:bookly/feature/home/presentation/manage/fetch_newest_books_cubit.dart';
import 'package:bookly/feature/home/presentation/view/compotes/bestSellerListView.dart';
import 'package:bookly/feature/home/presentation/view/compotes/build_buaner.dart';
import 'package:bookly/feature/home/presentation/view/compotes/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  FetchFeatureBooksCubit(GetIt.instance.get<HomeRepoImple>())
                    ..fetchFeatureBooks()),
          BlocProvider(
            create: (context) =>
                FetchNewestBooksCubit(GetIt.instance.get<HomeRepoImple>())
                  ..fetchNewestBooks(),
          ),
        ],
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomScrollView(
              physics:BouncingScrollPhysics(),
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
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: const Text(
                      "Best Seller",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Use BestSellerListView directly as a sliver
                BestSellerListView(), // This is now a sliver
              ],
            ),
          ),
        ),
      ),
    );
  }
}
