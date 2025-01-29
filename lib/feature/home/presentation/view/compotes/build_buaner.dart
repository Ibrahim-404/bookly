import 'package:bookly/feature/home/presentation/manage/fetch_feature_books_cubit.dart';
import 'package:bookly/feature/home/presentation/view/compotes/buaner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildBuaner extends StatelessWidget {
  final double ratio;
  double? itemHeight;
  BuildBuaner(
      {super.key,
      required this.ratio,
      thisitemHeight});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight ?? 200,
      child: BlocBuilder<FetchFeatureBooksCubit,FetchFeatureBooksState>(
          bloc: context.read<FetchFeatureBooksCubit>(),
          builder: (context, state) {
          if(state is FetchFeatureBooksLoading){
            return const Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.blue),
            ));
          }else if(state is FetchFeatureBooksSuccess){
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.items!.length,
                itemBuilder: (context, index) {
                  final book = state.books.items![index];
                  return CustomBookItemBanner(images: book.volumeInfo!.imageLinks.thumbnail);
                });
          }else if(state is FetchFeatureBooksfailure){
            return Center(child: Text(state.message));
          }else{
            return Text("opps something went wrong!!..😒");
          }
          }),
    );
  }
}
class CustomBookItemBanner extends StatelessWidget {
 final String images;
   CustomBookItemBanner({super.key, required this.images});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
child: AspectRatio(
    aspectRatio:0.7,
    child: CachedNetworkImage(imageUrl:images , fit: BoxFit.fill,
    fadeInCurve: Curves.bounceInOut,
      // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    )),
    );
  }
}
