import 'package:bloc/bloc.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:bookly/feature/home/data/repo/home_services_imple.dart';
import 'package:meta/meta.dart';

part 'fetch_feature_books_state.dart';

class FetchFeatureBooksCubit extends Cubit<FetchFeatureBooksState> {
  FetchFeatureBooksCubit(this.homeRepoImple)
      : super(FetchFeatureBooksInitial());
  HomeRepoImple homeRepoImple;

  Future<void> fetchFeatureBooks() async {
    emit(FetchFeatureBooksLoading());
    final result = await homeRepoImple.fetchFeatureBooks();
    result.fold(
      (failer) {
        emit(FetchFeatureBooksfailure(message: failer.message));
        print(failer.message);
      },
      (result) {
        emit(FetchFeatureBooksSuccess(books:result));
      },
    );
  }
}
