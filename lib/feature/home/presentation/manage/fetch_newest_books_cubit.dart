import 'package:bloc/bloc.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home.dart';
import 'package:bookly/feature/home/data/repo/home_services_imple.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit(this.homeRepoImple) : super(FetchNewestBooksInitial());
  HomeRepoImple homeRepoImple;
  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    final result = await homeRepoImple.fetchNewestBooks();
    result.fold((failer) {
      emit(FetchNewestBooksFailure(message: failer.message));
    }, (books) {
      emit(FetchNewestBooksSuccess(books: books));
    });
  }
}
