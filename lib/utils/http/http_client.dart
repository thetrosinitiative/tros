import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tros/utils/exceptions/auth_esception.dart';
import 'package:http/http.dart' as http;

// class THttpHelper {
//   // static const String _baseUrl = 'https://your-api-base-url.com';

//   late Dio dio;

//   static final THttpHelper _instance = THttpHelper._internal();

//   factory THttpHelper() => _instance;

//   THttpHelper._internal() {
//     dio = Dio();

//     dio.interceptors.add(
//       InterceptorsWrapper(
//         // onRequest: (options, handler) async {
//         //   if (options.baseUrl != null) {
//         //     options.baseUrl = baseUrl;
//         //   }
//         //   handler.next(options);
//         // },
//         // onResponse: (response, handler) async {
//         //   if (response.statusCode == 401) {
//         //     throw AuthException();
//         //   }
//         //   handler.next(response);
//         // },
//         onError: (error, handler) async {
//           {
//             _handleResponse(error.response!.data);
//           }
//         },
//       ),
//     );
//   }

//   // helper method to make get request
//   Future<Map<String, dynamic>> get(String endpoint, String baseUrl) async {
//     final response = await dio.get('$baseUrl/$endpoint');
//     return _handleResponse(response);
//   }

//   // helper method for POST request
//   Future<Map<String, dynamic>> post(
//       {required String baseUrl,
//       required Map<String, String> data,
//       required String endpoint}) async {
//     final response = await dio.post(
//       '$baseUrl/$endpoint',
//       data: data,
//     );
//     return _handleResponse(response);
//   }

//   // helper method for patch request
//   Future<Map<String, dynamic>> patch({
//     required String baseUrl,
//     required Map<String, String> data,
//   }) async {
//     final response = await dio.patch(
//       baseUrl,
//       data: data,
//     );
//     return _handleResponse(response);
//   }

//   // helper for PUT method
//   Future<Map<String, dynamic>> put(
//       {required String baseUrl,
//       required Map<String, String> data,
//       String? endpoint}) async {
//     final response = await dio.put(
//       'baseUrl/${endpoint!}',
//       data: json.encode(data),
//     );
//     return _handleResponse(response);
//   }

// // helper for DELETE request
//   Future<Map<String, dynamic>> delete(
//       {required String baseUrl,
//       required Map<String, String> data,
//       String? endpoint}) async {
//     final response = await dio.delete(
//       '$baseUrl/${endpoint!}',
//     );
//     return _handleResponse(response);
//   }

//   Map<String, dynamic> _handleResponse(Response response) {
//     debugPrint(response.statusCode.toString());
//     debugPrint(response.data.toString());

//     if (response.statusCode! >= 200 && response.statusCode! < 300) {
//       if (response.data.runtimeType == String) {
//         return {'data': response.data};
//       } else {
//         return response.data;
//       }
//     } else {
//       throw CustomException(
//           code: response.statusCode!, message: response.statusMessage!);
//     }
//   }
// }

class THttpHelper {
  // helper method to make get request
  static Future<Map<String, dynamic>> get(String? endpoint, String baseUrl,
      {String? accessToken}) async {
    debugPrint(endpoint);
    debugPrint(accessToken);

    final response = (endpoint == null || endpoint.isEmpty)
        ? accessToken != null
            ? await http.get(Uri.parse(baseUrl),
                headers: {'Authorization': 'Bearer $accessToken!'})
            : await http.get(
                Uri.parse(baseUrl),
              )
        : accessToken != null
            ? await http.get(Uri.parse('$baseUrl/$endpoint'),
                headers: {'Authorization': 'Bearer $accessToken!'})
            : await http.get(
                Uri.parse('$baseUrl/$endpoint'),
              );
    // debugPrint(response.toString());

    return _handleResponse(response);
  }

  // helper method for POST request
  static Future<Map<String, dynamic>> post(
      {required String baseUrl,
      required Map<String, String> data,
      required String endpoint}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      // headers: {'Content-Type': 'applicaton/json'},
      body: data,
    );
    return _handleResponse(response);
  }

  // helper method for patch request
  static Future<Map<String, dynamic>> patch({
    required String baseUrl,
    required Map<String, String> data,
  }) async {
    final response = await http.patch(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'applicaton/json'},
      body: data,
    );
    return _handleResponse(response);
  }

  // helper for PUT method
  static Future<Map<String, dynamic>> put(
      {required String baseUrl,
      required Map<String, String> data,
      String? endpoint}) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'applicaton/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

// helper for DELETE request
  static Future<Map<String, dynamic>> delete(
      {required String baseUrl,
      required Map<String, String> data,
      String? endpoint}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
    );
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    debugPrint(response.statusCode.toString());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // if (response.body.runtimeType == String) {
      //   return {'body': jsonDecode(response.body)};
      // } else {
      final body = jsonDecode(response.body);

      return body;
      // }
    } else {
      final body = jsonDecode(response.body);
      debugPrint(body.toString());
      throw CustomException(
          code: response.statusCode, message: body['message']);
    }
  }
}
