import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/onboarding_screen/choose_index_question.dart';
import 'package:skyyoga/screens/onboarding_screen/widget/choose_index_gender.dart';

class ChooseNameAndGenderScreen extends StatefulWidget {
  const ChooseNameAndGenderScreen({super.key});

  @override
  State<ChooseNameAndGenderScreen> createState() =>
      _ChooseNameAndGenderScreenState();
}

class _ChooseNameAndGenderScreenState extends State<ChooseNameAndGenderScreen> {
  int? selectedIndex;
  bool isButtonEnabled = false;
  TextEditingController userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userNameController.addListener(checkButtonStatus);
  }

  @override
  void dispose() {
    userNameController.removeListener(checkButtonStatus);
    userNameController.dispose();
    super.dispose();
  }

  void checkButtonStatus() {
    setState(
      () {
        isButtonEnabled =
            selectedIndex != null && userNameController.text.trim().isNotEmpty;
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
                  bottom: size.height * 0.03,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: size.height * 0.03,
                      children: [
                        Column(
                          spacing: size.height * 0.02,
                          children: [
                            AppBarAuthentication(size: size, isback: false),
                            Column(
                              children: [
                                Column(
                                  spacing: size.height * 0.01,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        AppString.hintTextOnboarding,
                                        style: AppTextStyle.mainTitle,
                                        minFontSize: 16,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        AppString.descriptionOnboarding,
                                        style: AppTextStyle.descreptionAuth,
                                        minFontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                FieldInputText(
                                  hintText: AppString.hintTextOnboarding,
                                  hintStyle: TextStyle(),
                                  size: size,
                                  controller: userNameController,
                                  textError: null,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          spacing: size.height * 0.03,
                          children: [
                            Column(
                              spacing: size.height * 0.01,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    AppString.confirmGenderTitleOnboarding,
                                    style: AppTextStyle.mainTitle,
                                    minFontSize: 16,
                                    maxLines: 1,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    AppString
                                        .confirmGenderDescriptionOnboarding,
                                    style: AppTextStyle.descreptionAuth,
                                    minFontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 0;
                                      checkButtonStatus();
                                    });
                                  },
                                  child: ChooseIndexGender(
                                    size: size,
                                    text: AppString.chooseMaleOnboarding,
                                    isActive: selectedIndex == 0 ? true : false,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 1;
                                      checkButtonStatus();
                                    });
                                  },
                                  child: ChooseIndexGender(
                                    size: size,
                                    text: AppString.chooseFemaleOnboarding,
                                    isActive: selectedIndex == 1 ? true : false,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedIndex = 2;
                                      checkButtonStatus();
                                    });
                                  },
                                  child: ChooseIndexGender(
                                    size: size,
                                    text: AppString.chooseNonBirnyOnboarding,
                                    isActive: selectedIndex == 2 ? true : false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                              setState(
                                () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 500),
                                      pageBuilder: (_, __, ___) =>
                                          ChooseIndexQuestion(
                                        username: userNameController.text,
                                      ),
                                      transitionsBuilder: (_,
                                          Animation<double> animation,
                                          __,
                                          Widget child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                    ),
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
                              : AppWidgetColor.unactiveButton,
                        ),
                      ),
                      child: AutoSizeText(
                        AppString.bottonOnboarding,
                        style: AppTextStyle.bottonSubmitTextStyle,
                        minFontSize: 8,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
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
