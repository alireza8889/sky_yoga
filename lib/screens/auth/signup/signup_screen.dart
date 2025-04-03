import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/login_auth.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool obscureText = true;
  bool isButtonEnabled = false;
  bool passwordValid = false;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  var controller = Get.put(SignUpController());

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
          (passwordValid && passwordTextEditingController.text.isNotEmpty);
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
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    right: size.width * 0.05,
                    left: size.width * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          AppBarAuthentication(size: size, isback: true),
                          AuthTextWidget(
                            size: size,
                            title: AppString.titleSignUp,
                            description: AppString.descriptionSignUp,
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
                                FlutterPwValidator(
                                  defaultColor: Color(0xff7A7F85),
                                  successColor: Color(0xff15BD2E),
                                  failureColor: Color(0xff7A7F85),
                                  controller: passwordTextEditingController,
                                  minLength: 8,
                                  uppercaseCharCount: 1,
                                  numericCharCount: 1,
                                  specialCharCount: 1,
                                  width: size.width * 0.9,
                                  height: size.height * 0.14,
                                  onFail: () {
                                    setState(
                                      () {
                                        passwordValid = false;
                                        _updateButtonState();
                                      },
                                    );
                                  },
                                  onSuccess: () {
                                    setState(
                                      () {
                                        passwordValid = true;
                                        _updateButtonState();
                                      },
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: size.height * 0.02,
                ),
                child: Column(
                  spacing: size.height * 0.03,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(
                      () => ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () {
                                setState(
                                  () {
                                    controller.singup(
                                      emailTextEditingController.text,
                                      passwordTextEditingController.text,
                                    );
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
                                : AppWidgetColor.unactiveBotton,
                          ),
                        ),
                        child: controller.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : AutoSizeText(
                                AppString.signUp,
                                style: AppTextStyle.bottonSubmitTextStyle,
                                minFontSize: 8,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                      ),
                    ),
                    BottomLoginOrSignUp(
                      size: size,
                      descriptionText: AppString.textLoginAccountAuth,
                      loginOrSignUpText: AppString.login,
                      child: AuthLoginScreen(),
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
