import 'package:bookly/feature/home/data/model/list_of_book_home_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiServices(this._dio);

  Future<ModelForListOfBooksHome?> getNewestBooks({required String endPoint}) async {
    try {
      final response = await _dio.get(_baseUrl + endPoint);
      if (response.statusCode == 200 && response.data != null) {
        // Log the response to see its structure
        print('Response data: ${response.data}');
        final items = response.data['items'] as List?; // Use List? to allow null
        if (items == null) {
          return null; // Return an empty list if no items are found
        }

        return ModelForListOfBooksHome.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}