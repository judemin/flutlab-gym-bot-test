import 'package:flutter/material.dart';
import 'package:gym_bot/domain/usecases/signup_usecase.dart';
import 'package:gym_bot/data/models/user_data.dart';

class SignUpPage extends StatefulWidget {
  final SignUpUseCase signUpUseCase;

  SignUpPage({required this.signUpUseCase});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  void _signUp() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;

    UserData userData = UserData(email: email, password: password, name: name);
    // Presentation Layer에서 Use case 호출
    widget.signUpUseCase.signUp(userData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gym-Bot 회원가입'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: '이메일'),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: '비밀번호'),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: '이름'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('회원가입'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('로그인'),
            )
          ],
        ),
      ),
    );
  }
}
