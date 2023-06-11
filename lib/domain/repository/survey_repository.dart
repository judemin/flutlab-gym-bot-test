import 'package:gym_bot/data/models/survey_data.dart';
import 'package:gym_bot/data/repository/local_storage_api.dart';
import 'package:gym_bot/data/repository/survey_api.dart';

class SurveyRepository {
  String url = "";
  String path = "";
  String token = "N/A";

  Future addSurvey(SurveyData surveyData) async {
    url = "https://gym-bot-backend.run.goorm.site/survey/addSurvey";
    token = await LocalStorageAPI().getToken();

    var res = await SurveyAPI().postReq(surveyData, token, url);
    int resCode = int.parse("${res.statusCode}");
    print("SurveyRepository : " + token + "  " + resCode.toString());

    if (200 <= resCode && resCode < 300) {
      print("${res.body}");
    } else {
      // 에러 핸들링
      print("${res.body}");
    }
  }
}
