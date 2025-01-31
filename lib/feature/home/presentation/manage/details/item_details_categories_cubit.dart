import 'package:bloc/bloc.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:meta/meta.dart';
import 'package:bookly/feature/home/data/repo/home_services_imple.dart';

part 'item_details_categories_state.dart';

class ItemDetailsCategoriesCubit extends Cubit<ItemDetailsCategoriesState> {
  ItemDetailsCategoriesCubit(this.homeRepoImple) : super(ItemDetailsCategoriesInitial());
  HomeRepoImple homeRepoImple;

  Future<void> fetchSimilarBooks() async {
    emit(ItemDetailsCategoriesLoading());
    final result = await homeRepoImple.SimilarBooks(category: "Programming");
    result.fold(
          (failer) {
        emit(ItemDetailsCategoriesFailure(message: failer.message));
        print(failer.message);
      },
          (result) {
        emit(ItemDetailsCategoriesSuccess(books:result));
      },
    );
  }

}
