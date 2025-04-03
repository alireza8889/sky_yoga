import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/profile_screen/goals_screen/widget/appbar_widget.dart';
import 'package:skyyoga/screens/profile_screen/profile_screen.dart';

class ChooseFirstGoalsScreen extends StatefulWidget {
  const ChooseFirstGoalsScreen({super.key});

  @override
  State<ChooseFirstGoalsScreen> createState() => _ChooseFirstGoalsScreenState();
}

class _ChooseFirstGoalsScreenState extends State<ChooseFirstGoalsScreen> {
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
          SafeArea(
            child: Scaffold(
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
                    SizedBox(
                      child: AutoSizeText(
                        AppString.titleGoalsOnboarding,
                        style: AppTextStyle.titleGoalTextStyle,
                        minFontSize: 10,
                      ),
                    ),
                    Column(
                      spacing: size.height * 0.03,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          spacing: size.width * 0.08,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 1;
                                });
                              },
                              child: SelectedGoals(
                                size: size,
                                isActive: isSelected == 1,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 2;
                                });
                              },
                              child: SelectedGoals(
                                size: size,
                                isActive: isSelected == 2,
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: size.width * 0.08,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 3;
                                });
                              },
                              child: SelectedGoals(
                                size: size,
                                isActive: isSelected == 3,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 4;
                                });
                              },
                              child: SelectedGoals(
                                size: size,
                                isActive: isSelected == 4,
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: size.width * 0.08,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 5;
                                });
                              },
                              child: SelectedGoals(
                                size: size,
                                isActive: isSelected == 5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 6;
                                });
                              },
                              child: SelectedGoals(
                                size: size,
                                isActive: isSelected == 6,
                              ),
                            )
                          ],
                        ),
                        Row(
                          spacing: size.width * 0.08,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 7;
                                });
                              },
                              child: SelectedGoals(
                                size: size,
                                isActive: isSelected == 7,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelected = 8;
                                });
                              },
                              child: SelectedGoals(
                                size: size,
                                isActive: isSelected == 8,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                          (route) => false,
                        );
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
          ),
        ],
      ),
    );
  }
}

class SelectedGoals extends StatelessWidget {
  const SelectedGoals({
    super.key,
    required this.size,
    required this.isActive,
  });

  final Size size;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: size.height * 0.13, maxWidth: size.width * 0.5),
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.04),
          borderRadius: BorderRadius.circular(24),
          border:
              Border.all(color: isActive ? Colors.blue : Colors.transparent)),
      child: Padding(
        padding: EdgeInsets.all(14),
        child: Image.asset(
          Assets.img.png.layer.path,
          height: size.height * 0.09,
        ),
      ),
    );
  }
}
