import 'package:flutter/material.dart';
import 'package:gym_bot/data/models/user_data.dart';
import 'package:gym_bot/domain/repository/user_repository.dart';
import 'package:gym_bot/domain/usecases/login_usecase.dart';
import 'package:gym_bot/domain/usecases/signup_usecase.dart';
import 'package:gym_bot/presentation/screens/signup_page.dart';
import 'package:gym_bot/presentation/screens/survey_page.dart';

class LoginPage extends StatefulWidget {
  final LoginUseCase loginUseCase;

  LoginPage({required this.loginUseCase});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //BuildContext _context;
  String _email = "";
  String _password = "";

  _LoginPageState() {
    initTokenCheck();
  }

  void toSurveyPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SurveyApp()));
  }

  Future handleLogin() async {
    UserData userData = UserData(email: _email, password: _password, name: "");
    bool isSuccess = await widget.loginUseCase.login(userData);

    if (isSuccess) {
      toSurveyPage();
    } else {
      print("Invalid User Auth");
    }
  }

  Future initTokenCheck() async {
    if (await widget.loginUseCase.hasSavedToken()) {
      toSurveyPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym-Bot 로그인'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  _email = value;
                });
              },
              decoration: InputDecoration(
                labelText: '이메일',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  _password = value;
                });
              },
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: handleLogin,
              child: Text('로그인'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignUpPage(
                          signUpUseCase:
                              SignUpUseCase(userRepository: UserRepository()))),
                );
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}
