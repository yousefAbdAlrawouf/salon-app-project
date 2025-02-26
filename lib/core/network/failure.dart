
import 'package:dio/dio.dart';

class Failure {
  final String message;
  final int? statusCode;
  Failure({
    required this.message,
    this.statusCode,
  });

  factory Failure.handleException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Failure(message: 'Internet error');
      case DioExceptionType.sendTimeout:
        return Failure(message: 'Internet error');
      case DioExceptionType.receiveTimeout:
        return Failure(message: 'Internet error');
      case DioExceptionType.badCertificate:
        return Failure(message: 'Internet error');

      case DioExceptionType.badResponse:
        if (e.response!.statusCode! > 400 && e.response!.statusCode! < 500) {
          return Failure(message: e.response!.data['message']);
        } else if (e.response!.statusCode! >= 500) {
          return Failure(message: e.response!.data['message']);
        } else {
          return Failure(message: 'Error happened, Try again');
        }

      case DioExceptionType.cancel:
        return Failure(message: 'Error by user cancellation');
      case DioExceptionType.connectionError:
        return Failure(message: 'Check Your Internet');
      case DioExceptionType.unknown:
        return Failure(message: 'Error happened, Try again');
    }
  }
}
