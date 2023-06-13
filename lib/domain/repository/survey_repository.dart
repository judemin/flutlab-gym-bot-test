import 'package:gym_bot/data/models/survey_data.dart';
import 'package:gym_bot/data/repository/local_storage_api.dart';
import 'package:gym_bot/data/repository/survey_api.dart';

// flutter에서는 http reponse 400번대를 받지 못함
// => 해당 사항 구글링하여 해결 필요 (express -> flutter 400x)
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
      return true;
    } else {
      // 에러 핸들링
      print("${res.body}");
      return false;
    }
  }
}
