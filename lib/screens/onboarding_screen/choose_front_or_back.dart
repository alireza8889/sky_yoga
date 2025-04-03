import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/onboarding_screen/choose_first_goals.dart';
import 'package:skyyoga/screens/onboarding_screen/choose_injuries_back.dart';
import 'package:skyyoga/screens/onboarding_screen/choose_injuries_front.dart';
import 'package:skyyoga/screens/profile_screen/goals_screen/widget/appbar_widget.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class ChooseFrontOrBack extends StatefulWidget {
  const ChooseFrontOrBack({super.key});

  @override
  State<ChooseFrontOrBack> createState() => _ChooseFrontOrBackState();
}

class _ChooseFrontOrBackState extends State<ChooseFrontOrBack> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors:
                          AppWidgetColor.gradientBackgroundHelpQuestionScreen,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Scaffold(
            appBar: GoalsAppBar(size: size),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.04,
                right: size.width * 0.04,
                bottom: size.height * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: size.height * 0.01,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: size.height * 0.02,
                    children: [
                      SizedBox(
                        child: AutoSizeText(
                          AppString.titleInjuriesOnboarding,
                          style: AppTextStyle.titleGoalTextStyle,
                          minFontSize: 10,
                        ),
                      ),
                      Row(
                        spacing: size.width * 0.01,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  size.width * 0.04,
                                  size.height * 0.01,
                                  size.width * 0.04,
                                  size.height * 0.01),
                              child: Text(
                                AppString.frontChooseBodyOnboarding,
                                style:
                                    AppTextStyle.frontOrBackSelectedTextStyle,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  size.width * 0.04,
                                  size.height * 0.01,
                                  size.width * 0.04,
                                  size.height * 0.01),
                              child: Text(
                                AppString.backChooseBodyOnboarding,
                                style: AppTextStyle.backOrBackSelectedTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: size.height * 0.6,
                        ),
                        child: SvgPicture.asset(Assets.img.svg.front),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigatePushWithFadeTransition(
                              context, ChooseInjuriesFront());
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: size.width * 0.425,
                            maxHeight: size.height * 0.06,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppWidgetColor
                                    .borderInjuriesBottomTextColor,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text(AppString.addInjuriesOnboarding,
                                style: AppTextStyle.bottonSubmitTextStyle),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          navigatePushWithFadeTransition(
                              context, ChooseBackScreen());
                        },
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(
                            Size(
                              size.width * 0.425,
                              size.height * 0.06,
                            ),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            AppWidgetColor.bottomSheetBotton,
                          ),
                        ),
                        child: AutoSizeText(
                          AppString.ok,
                          style: AppTextStyle.bottonSubmitTextStyle,
                          minFontSize: 8,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseBackScreen extends StatefulWidget {
  const ChooseBackScreen({super.key});

  @override
  State<ChooseBackScreen> createState() => _ChooseBackScreenState();
}

class _ChooseBackScreenState extends State<ChooseBackScreen> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors:
                          AppWidgetColor.gradientBackgroundHelpQuestionScreen,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Scaffold(
            appBar: GoalsAppBar(size: size),
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.04,
                right: size.width * 0.04,
                bottom: size.height * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: size.height * 0.01,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: size.height * 0.02,
                    children: [
                      SizedBox(
                        child: AutoSizeText(
                          AppString.titleInjuriesOnboarding,
                          style: AppTextStyle.titleGoalTextStyle,
                          minFontSize: 10,
                        ),
                      ),
                      Row(
                        spacing: size.width * 0.01,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  size.width * 0.04,
                                  size.height * 0.01,
                                  size.width * 0.04,
                                  size.height * 0.01),
                              child: Text(
                                AppString.frontChooseBodyOnboarding,
                                style: AppTextStyle.backOrBackSelectedTextStyle,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  size.width * 0.04,
                                  size.height * 0.01,
                                  size.width * 0.04,
                                  size.height * 0.01),
                              child: Text(
                                AppString.backChooseBodyOnboarding,
                                style:
                                    AppTextStyle.frontOrBackSelectedTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: size.height * 0.6,
                        ),
                        child: SvgPicture.asset(Assets.img.svg.back),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          navigatePushWithFadeTransition(
                              context, ChooseInjuriesBack());
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: size.width * 0.425,
                            maxHeight: size.height * 0.06,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppWidgetColor
                                    .borderInjuriesBottomTextColor,
                              ),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                            child: Text(AppString.addInjuriesOnboarding,
                                style: AppTextStyle.bottonSubmitTextStyle),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          navigatePushWithFadeTransition(
                              context, ChooseFirstGoalsScreen());
                        },
                        style: ButtonStyle(
                          minimumSize: WidgetStatePropertyAll(
                            Size(
                              size.width * 0.425,
                              size.height * 0.06,
                            ),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            AppWidgetColor.bottomSheetBotton,
                          ),
                        ),
                        child: AutoSizeText(
                          AppString.ok,
                          style: AppTextStyle.bottonSubmitTextStyle,
                          minFontSize: 8,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
