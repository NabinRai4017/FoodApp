import 'package:flutter/foundation.dart';
import 'package:food_app/service/service_manager.dart';
import 'package:http/http.dart' as http;

Future<http.Response> loginUser(Map<String, dynamic> data) async {
  var url = Uri.https(baseUrl, 'dj-rest-auth/login/');
  if (kDebugMode) {
    print(url);
  }
  final response = await http.post(
    url,
    headers: baseHeader,
    body: data,
  );
  return response;
}
