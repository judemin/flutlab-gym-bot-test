import 'package:gym_bot/data/models/survey_data.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

class SurveyAPI {
  Future<http.Response> postReq(
      SurveyData surveyData, String token, String url) async {
    var body = jsonEncode(surveyData.toJsonWithToken(token));

    print("SurveyAPI : " + body);

    var res = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print(res);
    return res;
  }
}
