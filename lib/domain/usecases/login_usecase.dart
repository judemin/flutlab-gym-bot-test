import 'package:gym_bot/domain/repository/user_repository.dart';
import 'package:gym_bot/data/models/user_data.dart';
import 'package:gym_bot/data/repository/local_storage_api.dart';

class LoginUseCase {
  final UserRepository userRepository;

  LoginUseCase({required this.userRepository});

  Future<bool> login(UserData userData) async {
    return await userRepository.login(userData);
  }

  Future<bool> hasSavedToken() async {
    String token = await LocalStorageAPI().getToken();
    if (token == "N/A") return false;
    return true;
  }
}
