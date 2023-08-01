import 'package:flutter/material.dart';
import 'package:gym_bot/domain/usecases/login_usecase.dart';
import 'package:gym_bot/presentation/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:gym_bot/domain/repository/user_repository.dart';
import 'package:gym_bot/presentation/theme/theme_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Gym-Bot Test',
        theme: ThemeData(
          visualDensity: VisualDensity.standard,
        ),
        // home: RegisterStep1Screen()
        home: LoginPage(
            loginUseCase: new LoginUseCase(userRepository: UserRepository())),
        );
  }
}
