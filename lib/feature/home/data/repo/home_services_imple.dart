import 'package:bookly/core/utils/constraint/failer.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:bookly/feature/home/data/repo/api_services.dart';
import 'package:bookly/core/fetch_newest_book.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeApiService {
  final ApiServices _apiServices;

  HomeRepoImple(this._apiServices);

  @override
  Future<Either<Failer, ModelForListOfBooksHome>>
      fetchNewestBooks() async {
    try {
      final books = await _apiServices.getBooks(
          endPoint:
              "volumes?q=subject:programming&filter =free-ebooks&Sorting=newest");
      return Right(books!);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailer.cheackErrorFromsatescode(e));
      }
      return Left(ServerFailer(e.toString()));
      print(e);
    }
  }

  @override
  Future<Either<Failer, ModelForListOfBooksHome>>
      fetchFeatureBooks() async {
    try {
      final books = await _apiServices.getBooks(
          endPoint: "volumes?q=subject:programming&filter =free-ebooks");
      return Right(books!);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailer.cheackErrorFromsatescode(e));
      }
      return Left(ServerFailer(e.toString()));
    }
  }

  @override
  Future<Either<Failer, ModelForListOfBooksHome>> SimilarBooks({required String category})async {
    try {
      final books = await _apiServices.getBooks(
          endPoint:
          "volumes?q=subject:$category&filter =relevance ");
      return Right(books!);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailer.cheackErrorFromsatescode(e));
      }
      return Left(ServerFailer(e.toString()));
      print(e);
    }
    throw UnimplementedError();
  }
}
