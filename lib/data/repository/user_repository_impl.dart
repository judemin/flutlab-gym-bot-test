import 'package:gym_bot/domain/repository/user_repository.dart';
import 'package:gym_bot/data/models/user_data.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  UserData? userData;

  @override
  void signUp(UserData userData) {
    // 데이터 소스와의 상호작용 및 회원가입 로직 구현
    // 예시로 데이터베이스에 새로운 사용자를 추가하는 로직을 작성
    this.userData = userData;
  }

  Future<http.Response> postRequest(String url) async {
    var body = userData.toJson();

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    print("${response.statusCode}");
    print("${response.body}");
    return response;
  }
}
