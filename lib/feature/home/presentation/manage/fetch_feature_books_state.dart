part of 'fetch_feature_books_cubit.dart';

@immutable
sealed class FetchFeatureBooksState {}

final class FetchFeatureBooksInitial extends FetchFeatureBooksState {}
final class FetchFeatureBooksLoading extends FetchFeatureBooksState {}
final class FetchFeatureBooksSuccess extends FetchFeatureBooksState {
  final List<ModelForListOfBooksHome>books;
  FetchFeatureBooksSuccess({required this.books});
}
final class FetchFeatureBooksfailure extends FetchFeatureBooksState {
  final String message;
  FetchFeatureBooksfailure({required this.message});
}
