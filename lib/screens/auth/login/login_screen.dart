import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/auth/signup/signup_auth.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  bool isButtonEnabled = false;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  var controller = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    emailTextEditingController.addListener(_updateButtonState);
    passwordTextEditingController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = emailTextEditingController.text.isNotEmpty &&
          passwordTextEditingController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: BackGroundColor(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.01,
                  right: size.width * 0.05,
                  left: size.width * 0.05,
                  bottom: size.height * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Column(
                        children: [
                          AppBarAuthentication(size: size, isback: true,),
                          AuthTextWidget(
                            size: size,
                            title: AppString.titleLogin,
                            description: AppString.descriptionLogin,
                          ),
                          FieldInputText(
                            size: size,
                            controller: emailTextEditingController,
                            hintText: AppString.email,
                            hintStyle: AppTextStyle.labelTextFieldInputAuth,
                            textError: controller.errorEmailMessage.isNotEmpty
                                ? controller.errorEmailMessage.first
                                : null,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: size.height * 0.02,
                              bottom: size.height * 0.02,
                            ),
                            child: Column(
                              spacing: size.height * 0.01,
                              children: [
                                TextField(
                                  cursorColor: Colors.black,
                                  controller: passwordTextEditingController,
                                  obscureText: obscureText,
                                  style: AppTextStyle.textFieldInputAuth,
                                  decoration: InputDecoration(
                                    hintText: AppString.password,
                                    hintStyle:
                                        AppTextStyle.labelTextFieldInputAuth,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppWidgetColor
                                            .borderSideTextFieldAuth,
                                      ),
                                    ),
                                    suffix: InkWell(
                                      onTap: () {
                                        setState(
                                          () {
                                            obscureText = !obscureText;
                                          },
                                        );
                                      },
                                      child: SvgPicture.asset(
                                        obscureText
                                            ? Assets.img.svg.eyeClose
                                            : Assets.img.svg.eyeOpen,
                                      ),
                                    ),
                                  ),
                                ),
                                controller.errorPasswordMessage.isNotEmpty
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: AutoSizeText(
                                          controller.errorPasswordMessage.first,
                                          style: AppTextStyle.errorTextStyle,
                                        ),
                                      )
                                    : SizedBox(),
                                GestureDetector(
                                  onTap: () {
                                    navigatePushWithFadeTransition(
                                      context,
                                        ForgotPasswordScreen());
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: AutoSizeText(
                                      AppString.forgotPassword,
                                      style:
                                          AppTextStyle.forgotPasswordTextStyle,
                                      minFontSize: 7,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      spacing: size.height * 0.03,
                      children: [
                        Obx(
                          () => ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                                    setState(
                                      () {
                                        controller.login(
                                            context,
                                            emailTextEditingController.text,
                                            passwordTextEditingController.text);
                                      },
                                    );
                                  }
                                : null,
                            style: ButtonStyle(
                              minimumSize: WidgetStatePropertyAll(
                                Size(
                                  size.width * 0.9,
                                  size.height * 0.06,
                                ),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                isButtonEnabled
                                    ? AppWidgetColor.activeBotton
                                    : AppWidgetColor.unactiveButton,
                              ),
                            ),
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : AutoSizeText(
                                    AppString.login,
                                    style: AppTextStyle.bottonSubmitTextStyle,
                                    minFontSize: 8,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          ),
                        ),
                        BottomLoginOrSignUp(
                          size: size,
                          descriptionText: AppString.textCreateAccountAuth,
                          loginOrSignUpText: AppString.textBottomSignUpAuth,
                          child: AuthSignUpScreen(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
