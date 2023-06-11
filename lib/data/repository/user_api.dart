import 'package:gym_bot/data/models/user_data.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:core';
import 'package:http/http.dart' as http;

class UserAPI {
  Future<http.Response> postReq(UserData userData, String url) async {
    var body = jsonEncode(userData.toJson());

    var res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    return res;
  }

  Future<http.Response> getReq(
      UserData userData, String authority, String path) async {
    Map<String, dynamic> queryParam = {
      'email': userData.email,
      'password': userData.password,
    };

    final uri = Uri.https(authority, path, queryParam);

    var res = await http
        .get(uri, headers: {HttpHeaders.contentTypeHeader: 'application/json'});

    return res;
  }
}
