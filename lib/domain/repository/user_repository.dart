import 'package:gym_bot/data/models/user_data.dart';

abstract class UserRepository {
  void signUp(UserData userData);
}
