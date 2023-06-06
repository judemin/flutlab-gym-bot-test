import 'package:gym_bot/data/repository/user_repository_impl.dart';

abstract class UserRepositoryImpl {
  void signUp(String email, String password, String name);
}
