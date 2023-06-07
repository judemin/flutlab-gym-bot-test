import 'package:gym_bot/domain/repository/user_repository.dart';
import 'package:gym_bot/data/models/user_data.dart';

class SignUpUseCase {
  final UserRepository userRepository;

  SignUpUseCase({required this.userRepository});

  void signUp(UserData userData) {
    // 도메인 로직 처리
    // 예시로 UserRepository를 사용하여 회원가입 로직을 처리
    userRepository.signUp(userData);
  }
}
