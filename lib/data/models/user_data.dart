class UserData {
  UserData({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
  });
  late final int id;
  // id가 -1이면 아직 user 정보를 받아오지 못한 것
  // signup 이후 server로부터 id값 response 받아 저장
  late final String email;
  late final String password;
  late final String name;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['password'] = password;
    _data['name'] = name;
    return _data;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserData && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UserData{id: $id}';
  }
}
