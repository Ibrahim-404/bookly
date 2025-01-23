import 'package:bookly/feature/home/data/model/list_of_book_home.dart';
import 'package:dio/dio.dart';
class ApiServices {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  ApiServices(this._dio);

  Future<List<ModelForListOfBooksHome>> getNewestBooks({required String endPoint}) async {
    try {
      final response = await _dio.get(_baseUrl + endPoint);
      if (response.statusCode == 200) {
        final items = response.data['items'] as List;
        return items.map((e) => ModelForListOfBooksHome.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}
