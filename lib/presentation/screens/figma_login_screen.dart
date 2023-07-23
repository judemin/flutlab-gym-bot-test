import 'package:gym_bot/core/app_export.dart';
import 'package:gym_bot/presentation/widgets/app_bar/appbar_image.dart';
import 'package:gym_bot/presentation/widgets/app_bar/appbar_title.dart';
import 'package:gym_bot/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:gym_bot/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                              hintText: "jane@example.com",
                              hintStyle: TextThemeHelper.bodyMediumBlack900,
                              textInputAction: TextInputAction.next,
                              textInputType: TextInputType.emailAddress,
                              filled: true,
                              fillColor: appTheme.whiteA700),
                          CustomTextFormField(
                              focusNode: FocusNode(),
                              autofocus: true,
                              controller: languageController,
                              margin: getMargin(top: 16),
                              contentPadding: getPadding(all: 17),
                              textStyle: TextThemeHelper.bodyMediumOnPrimary,
                              hintText: "••••••••••••",
                              hintStyle: TextThemeHelper.bodyMediumOnPrimary,
                              filled: true,
                              fillColor: appTheme.whiteA700),
                          Container(
                              height: getVerticalSize(52),
                              width: getHorizontalSize(361),
                              margin: getMargin(top: 17),
                              decoration: BoxDecoration(
                                  color: appTheme.teal500,
                                  borderRadius: BorderRadius.circular(
                                      getHorizontalSize(6)),
                                  border: Border.all(
                                      color: appTheme.teal500,
                                      width: getHorizontalSize(2)))),
                          Padding(
                              padding: getPadding(top: 46),
                              child: Text("아이디 찾기",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                      decoration: TextDecoration.underline))),
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
