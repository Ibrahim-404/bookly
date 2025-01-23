import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failer {
  final String message;

  Failer(this.message);
}

class ServerFailer extends Failer {
  ServerFailer(super.message);

  factory ServerFailer.cheackErrorFromsatescode(DioError error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailer("Connection Timeout API with API Server ");
      case DioExceptionType.sendTimeout:
        return ServerFailer("Send Timeout API with API Server ");
        throw UnimplementedError();
      case DioExceptionType.receiveTimeout:
        return ServerFailer("Receive Timeout API with API Server ");
      case DioExceptionType.badCertificate:
        return ServerFailer("Bad Certificate API with API Server ");
      case DioExceptionType.badResponse:
        return ServerFailer.fromrnsponse(
            error.response!.statusCode!, error.response!.data);
      case DioExceptionType.cancel:
        return ServerFailer("Cancel API with API Server ");
      case DioExceptionType.connectionError:
        return ServerFailer("Connection Error API with API Server ");
      case DioExceptionType.unknown:
        if (error.message!.contains("SocketException")) {
          return ServerFailer("No Internet Connection");
        }
        return ServerFailer("unknown Error API with API Server ");
        defoult:
        return ServerFailer("Something went wrong, please try again later😒");
    }
  }

  factory ServerFailer.fromrnsponse(int satescode, dynamic response) {
    if (satescode == 400 || satescode == 401 || satescode == 403) {
      return ServerFailer(response["error"]["message"]);
    } else if (satescode == 404) {
      return ServerFailer("Your request not found, please try again later!");
    } else if (satescode == 500) {
      return ServerFailer("Internal server error, please try again later!");
    } else {
      return ServerFailer("Something went wrong, please try again later😒");
    }
  }
}
