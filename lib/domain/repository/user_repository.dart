import 'package:flutter/material.dart';
import 'package:gym_bot/data/models/user_data.dart';
import 'package:gym_bot/data/repository/user_api.dart';

class UserRepository {
  String url = "";
  String path = "";

  Future signUp(UserData userData) async {
    url = "https://gym-bot-backend.run.goorm.site/auth/signup";

    var res = await UserAPI().postReq(userData, url);
    int resCode = int.parse("${res.statusCode}");

    if (200 <= resCode && resCode < 300) {
    } else {
      // 에러 핸들링
      print("${res.body}");
    }
  }

  Future login(UserData userData) async {
    url = "gym-bot-backend.run.goorm.site";
    path = "/auth/login";

    var res = await UserAPI().getReq(userData, url, path);
    int resCode = int.parse("${res.statusCode}");

    if (200 <= resCode && resCode < 300) {
      print(res.body.toString());
    } else {
      // 에러 핸들링
      print("${res.body}");
    }
  }
}
