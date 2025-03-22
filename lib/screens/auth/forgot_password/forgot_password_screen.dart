import 'package:auto_size_text/auto_size_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool obscureText = true;
  bool isButtonEnabled = false;

  TextEditingController emailTextEditingController = TextEditingController();

  var controller = Get.put(ForgotPasswordController());

  @override
  void initState() {
    super.initState();
    emailTextEditingController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    emailTextEditingController.dispose();
    controller.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(
      () {
        if (EmailValidator.validate(emailTextEditingController.text)) {
          isButtonEnabled = true;
        } else {
          isButtonEnabled = false;
        }
      },
    );
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
                          AppBarAuthentication(size: size, isback: true),
                          AuthTextWidget(
                            size: size,
                            title: AppString.titleForgotPassword,
                            description: AppString.descriptionForgotPassword,
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
                                        controller.forgotpass(
                                            emailTextEditingController.text);
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
                                    AppString.bottomTextForgotPassword,
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
