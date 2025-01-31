part of 'item_details_categories_cubit.dart';

@immutable
sealed class ItemDetailsCategoriesState {}

final class ItemDetailsCategoriesInitial extends ItemDetailsCategoriesState {}

final class ItemDetailsCategoriesLoading extends ItemDetailsCategoriesState {}

final class ItemDetailsCategoriesSuccess extends ItemDetailsCategoriesState {
  final ModelForListOfBooksHome books;

  ItemDetailsCategoriesSuccess({required this.books});
}

final class ItemDetailsCategoriesFailure extends ItemDetailsCategoriesState {
  final String message;

  ItemDetailsCategoriesFailure({required this.message});
}
