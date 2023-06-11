import 'package:gym_bot/domain/repository/user_repository.dart';
import 'package:gym_bot/data/models/user_data.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase({required this.userRepository});

  void login(UserData userData) {
    userRepository.login(userData);
  }
}
