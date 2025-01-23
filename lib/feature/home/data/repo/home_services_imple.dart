import 'package:bookly/core/utils/constraint/failer.dart';
import 'package:bookly/feature/home/data/model/list_of_book_home.dart';
import 'package:bookly/feature/home/data/repo/api_services.dart';
import 'package:bookly/feature/home/data/repo/fetch_newest_book.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeApiService {
  final ApiServices _apiServices;

  HomeRepoImple(this._apiServices);

  @override
  Future<Either<Failer, List<ModelForListOfBooksHome>>> fetchFeatureBooks() async {
    try {
      final books = await _apiServices.getNewestBooks(endPoint: "volumes?q=subject:programming&filter =free-ebooks&Sorting=newest");
      return Right(books);
    } catch (e) {
      if (e is DioError) {
        return Left(ServerFailer.cheackErrorFromsatescode(e));
      }
      return Left(ServerFailer(e.toString()));
      print(e);
    }
  }

  @override
  Future<Either<Failer, List<ModelForListOfBooksHome>>> fetchNewestBooks() async {
    try {
      final books = await _apiServices.getNewestBooks(endPoint: "volumes?q=subject:programming&filter =free-ebooks");
      return Right(books);
    } catch (e) {
      if(e is DioError){
        return Left(ServerFailer.cheackErrorFromsatescode(e));
      }
      return Left(ServerFailer(e.toString()));
    }
  }
}
