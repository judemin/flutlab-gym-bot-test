import 'package:gym_bot/domain/repository//user_repository.dart';

class SignUpUseCase {
  final UserRepository userRepository;

  SignUpUseCase({required this.userRepository});

  void signUp(String email, String password, String name) {
    // 도메인 로직 처리
    // 예시로 UserRepository를 사용하여 회원가입 로직을 처리
    userRepository.signUp(email, password, name);
  }
}
