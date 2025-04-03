import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({super.key, required this.email, required this.password});
  final String email;
  final String password;

  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  var controller = Get.put(SignUpController());
  TextEditingController otpController = TextEditingController();

  bool isButtonEnabled = false;
  bool isResendCodeEnabled = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  late Timer _timer;
  int _start = 120;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        setState(
          () {
            if (_start == 0) {
              _timer.cancel();
              isResendCodeEnabled = true;
            } else {
              _start--;
              isResendCodeEnabled = false;
            }
          },
        );
      },
    );
  }

  String formatTimer(int sec) {
    int min = sec ~/ 60;
    int secounds = sec % 60;

    String minStr = min.toString().padLeft(2, '0');
    String secoundsStr = secounds.toString().padLeft(2, '0');
    return "$minStr:$secoundsStr";
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
                      children: [
                        AppBarAuthentication(size: size, isback: true),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: Column(
                            spacing: size.height * 0.01,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  AppString.titleOtp,
                                  style: AppTextStyle.mainTitle,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.9,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.45,
                                      child: AutoSizeText(
                                        AppString.descriptionOtp,
                                        style: AppTextStyle.descreptionAuth,
                                        minFontSize: 8,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * 0.4,
                                      child: AutoSizeText(
                                        widget.email,
                                        style: AppTextStyle.showEmailOtpAuth,
                                        minFontSize: 8,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.13,
                          child: OtpTextField(
                            cursorColor: Colors.black,
                            showCursor: false,
                            styles: [
                              AppTextStyle.timerTextStyle
                                  .apply(fontSizeFactor: 1.5),
                              AppTextStyle.timerTextStyle
                                  .apply(fontSizeFactor: 1.5),
                              AppTextStyle.timerTextStyle
                                  .apply(fontSizeFactor: 1.5),
                              AppTextStyle.timerTextStyle
                                  .apply(fontSizeFactor: 1.5),
                              AppTextStyle.timerTextStyle
                                  .apply(fontSizeFactor: 1.5),
                            ],
                            numberOfFields: 5,
                            focusedBorderColor:
                                AppWidgetColor.borderSideTextFieldAuth,
                            showFieldAsBox: false,
                            borderWidth: 4.0,
                            onSubmit: (String verificationCode) {
                              otpController.text = verificationCode;
                              isButtonEnabled = true;
                            },
                          ),
                        ),
                        Text(
                          formatTimer(_start),
                          style: AppTextStyle.timerTextStyle,
                        ),
                      ],
                    ),
                    Obx(
                      () => Column(
                        spacing: size.height * 0.03,
                        children: [
                          ElevatedButton(
                            onPressed: isButtonEnabled
                                ? () {
                                    setState(() {
                                      controller.otpCode(context, widget.email,
                                          otpController.text);
                                    });
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
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : AutoSizeText(
                                    AppString.submit,
                                    style: AppTextStyle.bottonSubmitTextStyle,
                                    minFontSize: 8,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                          ),
                          GestureDetector(
                            onTap: () {
                              isResendCodeEnabled
                                  ? {
                                      _timer.cancel(),
                                      setState(() {
                                        _start = 120;
                                        controller.resendCode(
                                          widget.email,
                                          widget.password,
                                        );
                                      }),
                                      startTimer()
                                    }
                                  // ignore: avoid_print
                                  : print(0);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: size.width * 0.02,
                              children: [
                                controller.errorOtpMessage.isNotEmpty
                                    ? AutoSizeText(
                                        controller.errorOtpMessage.first,
                                        style: AppTextStyle.errorTextStyle,
                                        minFontSize: 7,
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : AutoSizeText(
                                        AppString.askResendCode,
                                        style:
                                            AppTextStyle.accountLoginSignUpAuth,
                                        minFontSize: 7,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                AutoSizeText(
                                  AppString.resendCode,
                                  style: isResendCodeEnabled
                                      ? AppTextStyle.resendCode
                                          .apply(fontWeightDelta: 2)
                                      : AppTextStyle.accountLoginSignUpAuth
                                          .apply(fontWeightDelta: 2),
                                  minFontSize: 7,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
