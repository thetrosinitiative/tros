import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomException implements Exception {
  // the error message
  final String _message;
  int _code;

  CustomException({required int code, required String message})
      : _message = message,
        _code = code;

  // get the corresponding error message

  @override
  String toString() {
    if (_message == "") return "Exception";
    return _message;
  }

  void onError(CustomException eInfo) {
    debugPrint(
        'error.code -> ${eInfo._code}, error.message -> ${eInfo._message}');
    switch (eInfo._code) {
      case 400:
        debugPrint("Server syntax error");
        break;
      case 401:
        debugPrint("You are denied to continue");
        break;
      case 500:
        debugPrint("Server internal error");
        break;
      default:
        debugPrint("Unknown error");
        break;
    }
  }
}

CustomException createCustomException(DioException error, String errorMessage) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return CustomException(code: -1, message: "Connection timed out");
    case DioExceptionType.sendTimeout:
      return CustomException(code: -1, message: "Send timed out");
    case DioExceptionType.receiveTimeout:
      return CustomException(code: -1, message: "Receive timed out");
    case DioExceptionType.badCertificate:
      return CustomException(code: -1, message: "Bad SSL certificates");

    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return CustomException(code: 400, message: errorMessage);
        case 401:
          return CustomException(code: 401, message: errorMessage);
        case 403:
          return CustomException(code: 403, message: errorMessage);
        case 404:
          return CustomException(code: 404, message: errorMessage);
        case 500:
          return CustomException(code: 500, message: errorMessage);
        case 409:
          return CustomException(code: 409, message: errorMessage);

        default:
          return CustomException(code: 500, message: "Internal Server Error");
      }

    case DioExceptionType.cancel:
      return CustomException(code: -1, message: "Server canceled it");

    case DioExceptionType.connectionError:
      return CustomException(code: -1, message: "Connection error");

    case DioExceptionType.unknown:
      return CustomException(code: -1, message: "Unknown error");
  }
}
// class AuthException implements Exception {
//   final String _message;

//   AuthException({required int code, required String message})
//       : _message = message;
//   // get the corresponding error message

//   @override
//   String toString() {
//     if (_message == "") return "Exception";
//     return _message;
//   }
// }
