import 'package:gym_bot/data/models/survey_data.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class SurveyAPI {
  Future<http.Response> postReq(
      SurveyData surveyData, String token, String url) async {
    var body = jsonEncode(surveyData.toJsonWithToken(token));

    var res = await http.post(Uri.parse(url),
        headers: {"Content-Type": "application/json"}, body: body);

    return res;
  }
}
