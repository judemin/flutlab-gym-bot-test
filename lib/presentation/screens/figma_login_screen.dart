import 'package:flutter/material.dart';
import 'package:gym_bot/core/app_export.dart';
import 'package:gym_bot/presentation/widgets/custom_outlined_button.dart';
import 'package:gym_bot/presentation/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController languageController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.onPrimary,
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: getPadding(
              all: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgReply,
                  height: getVerticalSize(
                    11,
                  ),
                  width: getHorizontalSize(
                    12,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    top: 33,
                  ),
                  child: Text(
                    "Log in",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: theme.textTheme.displaySmall,
                  ),
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: emailController,
                  margin: getMargin(
                    top: 29,
                  ),
                  contentPadding: getPadding(
                    left: 16,
                    top: 17,
                    right: 16,
                    bottom: 17,
                  ),
                  textStyle: theme.textTheme.bodyMedium!,
                  hintText: "jane@example.com",
                  hintStyle: theme.textTheme.bodyMedium!,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  filled: true,
                  fillColor: theme.colorScheme.onPrimary,
                ),
                CustomTextFormField(
                  focusNode: FocusNode(),
                  autofocus: true,
                  controller: languageController,
                  margin: getMargin(
                    top: 16,
                  ),
                  contentPadding: getPadding(
                    all: 17,
                  ),
                  textStyle: theme.textTheme.bodyMedium!,
                  hintText: "••••••••••••",
                  hintStyle: theme.textTheme.bodyMedium!,
                  filled: true,
                  fillColor: theme.colorScheme.onPrimary,
                ),
                CustomOutlinedButton(
                  text: "Log in".toUpperCase(),
                  margin: getMargin(
                    top: 16,
                    bottom: 5,
                  ),
                  buttonStyle: ButtonThemeHelper.outlinePrimary.copyWith(
                      fixedSize: MaterialStateProperty.all<Size>(Size(
                    double.maxFinite,
                    getVerticalSize(
                      52,
                    ),
                  ))),
                  buttonTextStyle: theme.textTheme.labelLarge!,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
