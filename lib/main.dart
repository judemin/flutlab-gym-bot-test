import 'package:flutter/material.dart';
import 'package:gym_bot/domain/usecases/login_usecase.dart';
import 'package:gym_bot/presentation/screens/login_page.dart';
import 'package:provider/provider.dart';
import 'package:gym_bot/domain/repository/user_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym-Bot Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(
          loginUseCase: new LoginUseCase(userRepository: UserRepository())),
    );
  }
}
