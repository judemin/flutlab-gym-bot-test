import 'package:flutter/material.dart';
import 'package:gym_bot/core/app_export.dart';
import 'package:gym_bot/presentation/widgets/custom_outlined_button.dart';
import 'package:gym_bot/presentation/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class RegisterStep2Screen extends StatelessWidget {
  RegisterStep2Screen({Key? key}) : super(key: key);

  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.onPrimary,
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(all: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgReply,
                          height: getVerticalSize(11),
                          width: getHorizontalSize(12),
                          onTap: () {}),
                      Padding(
                          padding: getPadding(top: 33),
                          child: Text("Register",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.displaySmall)),
                      CustomTextFormField(
                          focusNode: FocusNode(),
                          autofocus: true,
                          controller: usernameController,
                          margin: getMargin(top: 29),
                          contentPadding: getPadding(all: 17),
                          textStyle: theme.textTheme.bodyMedium!,
                          hintText: "the_jane",
                          hintStyle: theme.textTheme.bodyMedium!,
                          filled: true,
                          fillColor: theme.colorScheme.onPrimary),
                      CustomOutlinedButton(
                          text: "sign up".toUpperCase(),
                          margin: getMargin(top: 16),
                          buttonStyle: ButtonThemeHelper.outlinePrimary
                              .copyWith(
                                  fixedSize: MaterialStateProperty.all<Size>(
                                      Size(double.maxFinite,
                                          getVerticalSize(52)))),
                          buttonTextStyle: theme.textTheme.labelLarge!),
                      Container(
                          width: getHorizontalSize(324),
                          margin: getMargin(top: 31, right: 18, bottom: 5),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        "By signing up, you agree to Photo’s ",
                                    style: TextStyle(
                                        color: theme.colorScheme.primary,
                                        fontSize: getFontSize(13),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "Terms of Service",
                                    style: TextStyle(
                                        color: theme.colorScheme.primary,
                                        fontSize: getFontSize(13),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline)),
                                TextSpan(
                                    text: " and \n",
                                    style: TextStyle(
                                        color: theme.colorScheme.primary,
                                        fontSize: getFontSize(13),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: "Privacy Policy.",
                                    style: TextStyle(
                                        color: theme.colorScheme.primary,
                                        fontSize: getFontSize(13),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline))
                              ]),
                              textAlign: TextAlign.left))
                    ]))));
  }
}
