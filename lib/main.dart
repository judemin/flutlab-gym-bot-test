import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:gym_bot/presentation/screens/signup_page.dart';
import 'package:gym_bot/presentation/screens/survey_page.dart';
import 'package:gym_bot/domain/usecases/signup_usecase.dart';
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
      home: SurveyApp(),
      //SignUpPage(signUpUseCase: new SignUpUseCase(userRepository: UserRepository())),
    );
  }
}
