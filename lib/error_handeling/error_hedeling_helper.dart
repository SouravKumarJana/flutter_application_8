import 'package:dio/dio.dart';

String handleDioError(DioException e) {
  if (e.response != null) {
    switch (e.response!.statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 404:
        return 'Data not found';
      case 500:
        return 'Server error';
      default:
        return 'Something went wrong';
    }
  } else {
    return 'No internet connection';
  }
}
