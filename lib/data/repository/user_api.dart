import 'package:gym_bot/data/models/user_data.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class UserAPI {
  Future<http.Response> postReq(UserData userData, String url) async {
    var body = jsonEncode(userData.toJson());

    var res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    return res;
  }
}
