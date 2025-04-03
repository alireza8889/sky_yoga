import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/profile_screen/goals_screen/widget/appbar_widget.dart';

class ChooseInjuriesFront extends StatefulWidget {
  const ChooseInjuriesFront({super.key});

  @override
  State<ChooseInjuriesFront> createState() => _ChooseInjuriesFrontState();
}

class _ChooseInjuriesFrontState extends State<ChooseInjuriesFront> {
  int isSelected = 0;
  List<String> items = [
    'Spasm',
    'Soreness',
    'Numbness',
    'Tightness',
    'Stiffness',
    'Sharp pain',
    'Swelling',
    'Burning',
    'Radiatiing pain',
    'Clicking',
  ];
  List<String> selectedIndex = [];

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
                          child: Row(
                            children: [
                              SvgPicture.asset(Assets.img.svg.front),
                              Column(
                                children: [
                                  for (String i in items)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (selectedIndex.contains(i)) {
                                            selectedIndex.remove(i);
                                          } else {
                                            selectedIndex.add(i);
                                          }
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(
                                            0,
                                            size.height * 0.005,
                                            0,
                                            size.height * 0.005),
                                        width: size.width * 0.3,
                                        height: size.height * 0.05,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: selectedIndex.contains(i)
                                              ? Color(0xffEE4F2B)
                                              : Color(0xff2E2F38),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: AutoSizeText(
                                              i,
                                              style: selectedIndex.contains(i)
                                                  ? AppTextStyle
                                                      .selectedIndexInInjurisbodyTextStyle
                                                  : AppTextStyle
                                                      .backOrBackSelectedTextStyle,
                                              minFontSize: 8,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
            ),
          ),
        ],
      ),
    );
  }
}
