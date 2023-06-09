import 'package:gym_bot/domain/repository/user_repository.dart';
import 'package:gym_bot/data/models/user_data.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase({required this.userRepository});

  void login(UserData userData) {
    // 도메인 로직 처리
    // 예시로 UserRepository를 사용하여 회원가입 로직을 처리
    userRepository.login(userData);
  }
}
