import 'package:gym_bot/domain/repository/user_repository.dart';
import 'package:gym_bot/data/models/user_data.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase({required this.userRepository});

  Future<bool> login(UserData userData) async {
    return await userRepository.login(userData);
  }
}
