import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_code_standardization/data/base_api.dart';

Future<Map<String, String>> get defaultHeaders async => {
      "Accept": "aplication/json",
      "Content-Type": "application/json; charset=UTF-8",
    };

// if Need Auth is false, it will ignore 401 and not rediredct to login page
Future<http.Response> requestGET(path,
    {bool needAuth = true, Map<String, dynamic>? query}) async {
  final url = BaseApi.appUri(path, queries: query);
  var header = await defaultHeaders;
  var response = await http.get(url, headers: header);

  // check if endpoint need auth
  if (response.statusCode == 401 && needAuth) {
    // do logout and force to login screen
  }

  return response;
}

Future<http.Response> requestPOST(path,
    {bool needAuth = true, Map? body}) async {
  final url = BaseApi.appUri(path);

  var header = await defaultHeaders;
  var response = await http.post(
    url,
    body: jsonEncode(body),
    headers: header,
  );

  // check if endpoint need auth
  if (response.statusCode == 401 && needAuth) {
    // do logout and force to login screen
  }

  return response;
}
