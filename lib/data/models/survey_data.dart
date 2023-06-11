class SurveyData {
  SurveyData({
    required this.machine,
    required this.extime,
    required this.experienceLevel,
  });
  late final String machine;
  late final String extime;
  late final String experienceLevel;

  SurveyData.fromJson(Map<String, dynamic> json) {
    machine = json['machine'];
    extime = json['extime'];
    experienceLevel = json['experienceLevel'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['machine'] = machine;
    _data['extime'] = extime;
    _data['experienceLevel'] = experienceLevel;
    return _data;
  }

  Map<String, dynamic> toJsonWithToken(String token) {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['machine'] = machine;
    _data['extime'] = extime;
    _data['experienceLevel'] = experienceLevel;
    return _data;
  }
}
