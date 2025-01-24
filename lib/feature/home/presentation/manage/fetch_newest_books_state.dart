part of 'fetch_newest_books_cubit.dart';

class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}
final class FetchNewestBooksLoading extends FetchNewestBooksState {}
final class FetchNewestBooksSuccess extends FetchNewestBooksState {
final List<ModelForListOfBooksHome>books;
  FetchNewestBooksSuccess({required this.books});
}
final class FetchNewestBooksFailure extends FetchNewestBooksState {
  String message;
  FetchNewestBooksFailure({required this.message});
}
