import 'dart:ffi';

class UserData {
  UserData({
    required this.email,
    required this.password,
    required this.name,
  });

  initData({
    required String phoneNumber,
    required String region,
    required int age,
    required bool isMarketingAgree,
    required bool isLogTraceAgree,
  }){
    this.phoneNumber = phoneNumber;
    this.region = region;
    this.age = age;
    this.isMarketingAgree = isMarketingAgree;
    this.isLogTraceAgree = isLogTraceAgree;
  }

  String token = "";
  // id가 -1이면 아직 user 정보를 받아오지 못한 것
  // signup 이후 server로부터 id값 response 받아 저장
  late final String email;
  late final String password;
  late final String name;
  late final String phoneNumber;
  late final String region;
  late final int age;
  late final bool isMarketingAgree;
  late final bool isLogTraceAgree;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    region = json['region'];
    age = json['age'];
    isMarketingAgree = json['isMarketingAgree'];
    isLogTraceAgree = json['isLogTraceAgree'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['email'] = email;
    _data['password'] = password;
    _data['name'] = name;
    _data['phoneNumber'] = phoneNumber;
    _data['region'] = region;
    _data['age'] = age;
    _data['isMarketingAgree'] = isMarketingAgree;
    _data['isLogTraceAgree'] = isLogTraceAgree;
    return _data;
  }

  @override
  String toString() {
    return 'UserData{token: $token}';
  }
}
