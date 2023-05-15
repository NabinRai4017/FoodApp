import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:food_app/service/service_manager.dart';
import 'package:http/http.dart' as http;

Future<http.Response> loginUser(Map<String, String> data) async {
  var url = Uri.parse('$baseUrl/dj-rest-auth/login/');
  if (kDebugMode) {
    print(url);
    print(jsonEncode(data));
  }
  final response = await http.post(
    url,
    headers: baseHeader,
    body: jsonEncode(data),
  );
  return response;
}
