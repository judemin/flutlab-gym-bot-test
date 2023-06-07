class UserData {
  UserData({
    required this.email,
    required this.password,
    required this.name,
  });
  String token = "";
  // id가 -1이면 아직 user 정보를 받아오지 못한 것
  // signup 이후 server로부터 id값 response 받아 저장
  late final String email;
  late final String password;
  late final String name;

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['email'] = email;
    _data['password'] = password;
    _data['name'] = name;
    return _data;
  }

  @override
  String toString() {
    return 'UserData{token: $token}';
  }
}
