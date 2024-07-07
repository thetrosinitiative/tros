import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tros/utils/exceptions/auth_esception.dart';
import 'package:http/http.dart' as http;

import '../../features/authentication/controllers/login/login_controller.dart';
import '../../features/personalization/controllers/userController.dart';

class THttpHelper {
  static final user = LoginController.instance;

  // helper method to make get request
  static Future<dynamic> get(
    String? endpoint,
    String baseUrl,
  ) async {
    debugPrint(endpoint);
    debugPrint(user.userToken.value);
    final userToken = user.userToken.value;

    final response = (endpoint == null || endpoint.isEmpty)
        ? await http.get(Uri.parse(baseUrl),
            headers: {'Authorization': 'Bearer $userToken'})
        : await http.get(Uri.parse('$baseUrl/$endpoint'),
            headers: {'Authorization': 'Bearer $userToken'});

    // debugPrint(response.toString());

    return _handleResponse(response);
  }

  // helper method to make map get requests
  static Future<dynamic> getM(
    String baseUrl,
  ) async {
    final response = await http.get(
      Uri.parse(baseUrl),
    );

    // debugPrint(response.toString());

    return _handleResponse(response);
  }

  // helper method for POST request
  static Future<dynamic> post(
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
  static Future<dynamic> patch({
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
  static Future<dynamic> put(
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
  static Future<dynamic> delete(
      {required String baseUrl,
      required Map<String, String> data,
      String? endpoint}) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
    );
    return _handleResponse(response);
  }

  static dynamic _handleResponse(http.Response response) {
    debugPrint(response.statusCode.toString());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // if (response.body.runtimeType == String) {
      //   return {'body': jsonDecode(response.body)};
      // } else {
      final body = jsonDecode(response.body);
      debugPrint(body.runtimeType.toString());
      debugPrint(body.toString());

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
