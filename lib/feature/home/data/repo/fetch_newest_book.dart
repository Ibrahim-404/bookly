import 'package:bookly/core/utils/constraint/failer.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home.dart';
import 'package:dartz/dartz.dart';
abstract class HomeApiService {
  Future<Either<Failer, List<ModelForListOfBooksHome>>>fetchNewestBooks();
  Future<Either<Failer, List<ModelForListOfBooksHome>>>fetchFeatureBooks();
}