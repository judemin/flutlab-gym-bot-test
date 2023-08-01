import 'package:flutter/material.dart';
import 'package:gym_bot/core/app_export.dart';
import 'package:gym_bot/presentation/widgets/app_bar/appbar_image.dart';
import 'package:gym_bot/presentation/widgets/app_bar/appbar_title.dart';
import 'package:gym_bot/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:gym_bot/presentation/widgets/custom_text_form_field.dart';
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
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _LoginPageState() {
    initTokenCheck();
  }

  void toSurveyPage() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => SurveyApp()));
  }

  Future handleLogin() async {
    UserData userData = UserData(
        email: emailController.text,
        password: passwordController.text,
        name: "");
    bool isSuccess = await widget.loginUseCase.login(userData);

    if (isSuccess) {
      // toSurveyPage();
      print(userData.token);
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
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(84),
                leadingWidth: 42,
                // leading: AppbarImage(
                //     height: getSize(24),
                //     width: getSize(24),
                //     svgPath: ImageConstant.imgArrowleft,
                //     margin: getMargin(left: 18, top: 15, bottom: 16),
                //     onTap: () {
                //       onTapArrowleft1(context);
                //     }),
                centerTitle: true,
                title: AppbarTitle(text: "athleo")),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: getPadding(left: 16, top: 86, right: 16),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Log in",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.displaySmall)),
                          CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: emailController,
                            margin: getMargin(top: 22),
                            contentPadding: getPadding(all: 17),
                            textStyle: TextThemeHelper.bodyMediumBlack900,
                            hintText: "gymbot@example.com",
                            hintStyle: TextThemeHelper.bodyMediumBlack900,
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.emailAddress,
                            filled: true,
                            fillColor: appTheme.whiteA700,
                          ),
                          CustomTextFormField(
                            focusNode: FocusNode(),
                            autofocus: true,
                            controller: passwordController,
                            margin: getMargin(top: 16),
                            contentPadding: getPadding(all: 17),
                            textStyle: TextThemeHelper.bodyMediumOnPrimary,
                            hintText: "••••••••••••",
                            hintStyle: TextThemeHelper.bodyMediumOnPrimary,
                            filled: true,
                            fillColor: appTheme.whiteA700,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: getVerticalSize(20),
                          ),
                          SizedBox(
                            height: getVerticalSize(
                                50), // Add appropriate spacing here
                            child: GestureDetector(
                              onTap: () {
                                // Add your onTap event handling logic here
                                print('Container tapped!');
                              },
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: appTheme.teal500,
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(6)),
                                    border: Border.all(
                                        color: appTheme.teal500,
                                        width: getHorizontalSize(2)),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      // Add your onTap event handling logic here if needed
                                      handleLogin();
                                    },
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(6)),
                                    child: Container(
                                      height: getVerticalSize(52),
                                      width: getHorizontalSize(361),
                                      child: Center(
                                        child: Text(
                                          'LOGIN',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage(
                                        signUpUseCase: SignUpUseCase(
                                            userRepository: UserRepository()))),
                              );
                            },
                            child: Padding(
                              padding: getPadding(top: 46),
                              child: Text(
                                "회원가입",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                              padding: getPadding(top: 15, bottom: 5),
                              child: Text("비밀번호 재설정",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline)))
                        ])))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleft1(BuildContext context) {
    Navigator.pop(context);
  }
}
