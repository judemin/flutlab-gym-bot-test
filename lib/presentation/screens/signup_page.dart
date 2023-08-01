import 'package:flutter/material.dart';
import 'package:gym_bot/core/app_export.dart';
import 'package:gym_bot/domain/usecases/signup_usecase.dart';
import 'package:gym_bot/data/models/user_data.dart';
import 'package:gym_bot/presentation/widgets/custom_text_form_field.dart';
import 'package:gym_bot/presentation/widgets/app_bar/appbar_title.dart';
import 'package:gym_bot/presentation/widgets/app_bar/appbar_image.dart';
import 'package:gym_bot/presentation/widgets/app_bar/custom_app_bar.dart';

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
  bool isMarketingAgree = false;
  bool isLogTraceAgree = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(84),
                leadingWidth: 42,
                leading: AppbarImage(
                    height: getSize(24),
                    width: getSize(24),
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 18, top: 15, bottom: 16),
                    onTap: () {
                      onTapArrowleft1(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "athleo")),
            body: SingleChildScrollView(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: getPadding(all: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                              //   svgPath: ImageConstant.imgReply,
                              height: getVerticalSize(11),
                              width: getHorizontalSize(12)),
                          Padding(
                              padding: getPadding(top: 33),
                              child: Text("Register",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.displaySmall)),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: _emailController,
                              margin: getMargin(top: 29),
                              contentPadding: getPadding(
                                  left: 16, top: 17, right: 16, bottom: 17),
                              textStyle: theme.textTheme.bodyMedium!,
                              hintText: "e-mail",
                              hintStyle: theme.textTheme.bodyMedium!,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              filled: true,
                              fillColor: theme.colorScheme.onPrimary),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: _passwordController,
                              margin: getMargin(top: 16),
                              contentPadding: getPadding(all: 17),
                              textStyle: theme.textTheme.bodyMedium!,
                              hintText: "password",
                              hintStyle: theme.textTheme.bodyMedium!,
                              filled: true,
                              fillColor: theme.colorScheme.onPrimary),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: _passwordController,
                              margin: getMargin(top: 16),
                              contentPadding: getPadding(all: 17),
                              textStyle: theme.textTheme.bodyMedium!,
                              hintText: "name",
                              hintStyle: theme.textTheme.bodyMedium!,
                              filled: true,
                              fillColor: theme.colorScheme.onPrimary),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: _passwordController,
                              margin: getMargin(top: 16),
                              contentPadding: getPadding(all: 17),
                              textStyle: theme.textTheme.bodyMedium!,
                              hintText: "region",
                              hintStyle: theme.textTheme.bodyMedium!,
                              filled: true,
                              fillColor: theme.colorScheme.onPrimary),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: _passwordController,
                              margin: getMargin(top: 16),
                              contentPadding: getPadding(all: 17),
                              textStyle: theme.textTheme.bodyMedium!,
                              hintText: "age",
                              hintStyle: theme.textTheme.bodyMedium!,
                              filled: true,
                              fillColor: theme.colorScheme.onPrimary),
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  theme.colorScheme.onPrimaryContainer,
                            ),
                            child: CheckboxListTile(
                              title: Text(
                                '마케팅 정보 수신 동의',
                                style: theme.textTheme.bodyMedium!,
                              ),
                              value: isMarketingAgree,
                              onChanged: (value) {
                                setState(() {
                                  isMarketingAgree = value ?? false;
                                });
                              },
                              dense: true,
                            ),
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor:
                                  theme.colorScheme.onPrimaryContainer,
                            ),
                            child: CheckboxListTile(
                              title: Text(
                                '사용자 로그 추적 동의',
                                style: theme.textTheme.bodyMedium!,
                              ),
                              value: isLogTraceAgree,
                              onChanged: (value) {
                                setState(() {
                                  isLogTraceAgree = value ?? false;
                                });
                              },
                              dense: true,
                            ),
                          ),
                          SizedBox(
                            height: getVerticalSize(16),
                          ),
                          SizedBox(
                            height: getVerticalSize(
                                50), // Add appropriate spacing here
                            child: GestureDetector(
                              child: Material(
                                color: Colors.transparent,
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: appTheme.blueGray700,
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(6)),
                                    border: Border.all(
                                        color: appTheme.blueGray700,
                                        width: getHorizontalSize(2)),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      // Add your onTap event handling logic here if needed
                                      print('InkWell tapped!');
                                    },
                                    borderRadius: BorderRadius.circular(
                                        getHorizontalSize(6)),
                                    child: Container(
                                      height: getVerticalSize(52),
                                      width: getHorizontalSize(361),
                                      child: Center(
                                        child: Text(
                                          'REGISTER',
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
                        ])))));
  }

  onTapArrowleft1(BuildContext context) {
    Navigator.pop(context);
  }
}
