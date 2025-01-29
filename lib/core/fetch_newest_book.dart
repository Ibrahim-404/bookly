import 'package:bookly/core/utils/constraint/failer.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:dartz/dartz.dart';
abstract class HomeApiService {
  Future<Either<Failer, ModelForListOfBooksHome>>fetchNewestBooks();
  Future<Either<Failer, ModelForListOfBooksHome>>fetchFeatureBooks();
}