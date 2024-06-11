import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tros/utils/exceptions/auth_esception.dart';

class THttpHelper {
  // static const String _baseUrl = 'https://your-api-base-url.com';

  // helper method to make get request
  static Future<Map<String, dynamic>> get(
      String endpoint, String baseUrl) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // helper method for POST request
  static Future<Map<String, dynamic>> post(
      String baseUrl, String endpoint, Map<String, String> data) async {
    final jsonFile = json.encode(data);
    debugPrint(jsonFile);
    final response = await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        // 'Content-Type': 'applicaton/json',
        // 'Accept': 'application/json'
      },
      body: data,
    );
    return _handleResponse(response);
  }

  // helper for PUT method
  static Future<Map<String, dynamic>> put(
      String baseUrl, String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {'Content-Type': 'applicaton/json'},
      body: json.encode(data),
    );
    debugPrint(response.headersSplitValues.toString());
    return _handleResponse(response);
  }

// helper for DELETE request
  static Future<Map<String, dynamic>> delete(
      String baseUrl, String endpoint, dynamic data) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/$endpoint'),
    );
    return _handleResponse(response);
  }

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      debugPrint(response.body);
      final body = json.decode(response.body);
      throw AuthException(code: response.statusCode, message: body["message"]);
    }
  }
}
