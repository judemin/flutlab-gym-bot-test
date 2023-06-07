import 'package:gym_bot/data/models/user_data.dart';
import 'package:gym_bot/data/repository/user_api.dart';

class UserRepository {
  String url = "";
  bool isSuccess = false;

  Future signUp(UserData userData) async {
    url = "https://gym-bot-backend.run.goorm.site/auth/signup";

    var res = await UserAPI().postReq(userData, url);
    int resCode = int.parse("${res.statusCode}");

    if (200 <= resCode && resCode < 300) {
      isSuccess = true;
    } else {
      // 에러 핸들링
      print("${res.body}");
    }
  }
}
