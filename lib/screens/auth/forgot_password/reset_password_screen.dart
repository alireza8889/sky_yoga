import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool obscureText1 = true;
  bool obscureText2 = true;
  bool isButtonEnabled = false;

  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  var controller = Get.put(ForgotPasswordController());

  @override
  void initState() {
    super.initState();
    passwordTextEditingController.addListener(_updateButtonState);
    confirmPasswordTextEditingController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = passwordTextEditingController.text.isNotEmpty &&
          confirmPasswordTextEditingController.text.isNotEmpty;
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
                    Column(
                      spacing: size.height * 0.03,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            AppBarAuthentication(size: size, isback: true),
                            AuthTextWidget(
                              size: size,
                              title: AppString.resetPasswoerd,
                              description: AppString.descriptionResetPassword,
                            ),
                          ],
                        ),
                        Column(
                          spacing: size.height * 0.04,
                          children: [
                            TextField(
                              cursorColor: Colors.black,
                              controller: passwordTextEditingController,
                              obscureText: obscureText1,
                              style: AppTextStyle.textFieldInputAuth,
                              decoration: InputDecoration(
                                hintText: AppString.password,
                                hintStyle: AppTextStyle.labelTextFieldInputAuth,
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        AppWidgetColor.borderSideTextFieldAuth,
                                  ),
                                ),
                                suffix: InkWell(
                                  onTap: () {
                                    setState(
                                      () {
                                        obscureText1 = !obscureText1;
                                      },
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    obscureText1
                                        ? Assets.img.svg.eyeClose
                                        : Assets.img.svg.eyeOpen,
                                  ),
                                ),
                              ),
                            ),
                            Obx(
                              () => Column(
                                spacing: size.height * 0.02,
                                children: [
                                  TextField(
                                    cursorColor: Colors.black,
                                    controller:
                                        confirmPasswordTextEditingController,
                                    obscureText: obscureText2,
                                    style: AppTextStyle.textFieldInputAuth,
                                    decoration: InputDecoration(
                                      hintText: AppString.confirmPassword,
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
                                              obscureText2 = !obscureText2;
                                            },
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          obscureText2
                                              ? Assets.img.svg.eyeClose
                                              : Assets.img.svg.eyeOpen,
                                        ),
                                      ),
                                    ),
                                  ),
                                  controller.errorConfirmMessage.isNotEmpty
                                      ? Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            controller
                                                .errorConfirmMessage.first,
                                            style: AppTextStyle.errorTextStyle,
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Obx(
                          () => ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                                    setState(
                                      () {
                                        controller.resetPassword(
                                            passwordTextEditingController.text,
                                            confirmPasswordTextEditingController
                                                .text);
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
                                    AppString.bottomForgotPassword,
                                    style: AppTextStyle.bottonSubmitTextStyle,
                                    minFontSize: 8,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          ),
                        ),
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
