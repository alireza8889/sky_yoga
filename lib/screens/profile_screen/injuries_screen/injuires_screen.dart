import 'dart:ui';
import 'package:get/get.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/main_screen/main_screen.dart';
import 'package:skyyoga/screens/profile_screen/goals_screen/widget/appbar_widget.dart';
import 'package:skyyoga/screens/profile_screen/injuries_screen/controller/injuries-screen_controller.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class ChooseInjuriesFrontProfileScreen extends StatefulWidget {
  const ChooseInjuriesFrontProfileScreen({super.key});

  @override
  State<ChooseInjuriesFrontProfileScreen> createState() =>
      _ChooseInjuriesFrontProfileScreenState();
}

class _ChooseInjuriesFrontProfileScreenState
    extends State<ChooseInjuriesFrontProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InjuiresScreenController());
    final size = MediaQuery.sizeOf(context);
    double svgWidth = size.width * 0.15; // تعیین عرض هر SVG
    double svgHeight = size.height * 0.15;
    return Stack(
      children: [
        //background
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
          appBar: AppBar(
            foregroundColor: Colors.white,
            title: Text('Sky',style: TextStyle(color: Colors.white),),backgroundColor: Colors.transparent,),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                // top: size.height * 0.02,
                left: size.width * 0.04,
                right: size.width * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //title
                      Container(
            // color: Colors.yellow,
                        height: size.height * 0.07,
            
                        child: AutoSizeText(
                          AppString.titleInjuriesOnboarding,
                          style: AppTextStyle.titleGoalTextStyle,
                          minFontSize: 10,
                        ),
                      ),
                      //back and front button
                      Obx(() {
                        final currentPage = controller
                            .currentPageIndex
                            .value;
                        return Container(
                          // color: Colors.red,
                          height: size.height * 0.04,
                          child: Row(
                            spacing: size.width * 0.01,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
            
                                GestureDetector(
            
                                  child: Container(

                                    height: size.height * 0.05,
            width:size.height * 0.11 ,
                                    decoration: BoxDecoration(

                                        color: currentPage
                                            == 0 ? Colors.white : Colors
                                            .transparent,
                                        borderRadius: BorderRadius.circular(
                                            100)),
                                    child: Center(
                                      child: AutoSizeText(
                                        minFontSize: 10,
                                        AppString.frontChooseBodyOnboarding,
                                        style:currentPage==0?
                                        AppTextStyle
                                            .frontOrBackSelectedTextStyle:AppTextStyle.backOrBackSelectedTextStyle,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    controller.changeBackAndFrontPage();
                                  },
                                ),
                            GestureDetector(
                                  onTap: () {
                                    controller.changeBackAndFrontPage();
                                  },
                                  child:  Container(
                                    width:size.height * 0.11 ,

                                    height: size.height * 0.05,
            
                                      decoration: BoxDecoration(
                                        color: currentPage == 1
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                            100),
                                      ),
                                      child: Center(
                                        child: AutoSizeText(
                                          minFontSize: 10,
                                          AppString.backChooseBodyOnboarding,
                                          style:
                                          currentPage==1?
                                          AppTextStyle
                                              .frontOrBackSelectedTextStyle:AppTextStyle.backOrBackSelectedTextStyle,
                                        ),
                                      ),
                                    )
                                ),
                            ],
                          ),
                        );
                      }),
                       //pageView
                      Container(
                        height: (size.height * 0.66),
            // color: Colors.purple,
                        child: PageView(
                            controller: controller.pageController,
                            children: [
                              Row(
                                children: [
                                  //body svg`s
                                  Container(
                                    width: size.height * 0.34,
                                    height: (size.height * 0.66),
                                    // color: Colors.blue,
                                    child:Stack(
                                      children: [
                                        // Head
                                        Positioned(
                                          top: size.height * 0.01, // کاهش ۰.۰۲
                                          left: size.height * 0.13,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.8,
                                            controller.svgPaths['front_head']!, color: Colors.white,
                                          ),
                                        ),

                                        // Shoulders
                                        Positioned(
                                          top: size.height * 0.10, // کاهش ۰.۰۲
                                          left: size.height * 0.09,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.242,
                                            controller.svgPaths['front_shoulder_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.10, // کاهش ۰.۰۲
                                          right: size.height * 0.081,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.242,
                                            controller.svgPaths['front_shoulder_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Chest
                                        Positioned(
                                          top: size.height * 0.15, // کاهش ۰.۰۲
                                          left: size.height * 0.108,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.351,
                                            controller.svgPaths['front_chest_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.15, // کاهش ۰.۰۲
                                          right: size.height * 0.108,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.351,
                                            controller.svgPaths['front_chest_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Stomach
                                        Positioned(
                                          top: size.height * 0.22, // کاهش ۰.۰۲
                                          left: size.height * 0.1125,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.726,
                                            controller.svgPaths['front_stomach_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.22, // کاهش ۰.۰۲
                                          right: size.height * 0.1125,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.726,
                                            controller.svgPaths['front_stomach_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Arms
                                        Positioned(
                                          top: size.height * 0.14, // کاهش ۰.۰۲
                                          left: size.height * 0.055,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.726,
                                            controller.svgPaths['front_arm_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.14, // کاهش ۰.۰۲
                                          right: size.height * 0.055,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.726,
                                            controller.svgPaths['front_arm_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Forearms
                                        Positioned(
                                          top: size.height * 0.26, // کاهش ۰.۰۲
                                          left: size.height * 0.045,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.60,
                                            controller.svgPaths['front_forearm_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.26, // کاهش ۰.۰۲
                                          right: size.height * 0.045,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.605,
                                            controller.svgPaths['front_forearm_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Wrists
                                        Positioned(
                                          top: size.height * 0.35, // کاهش ۰.۰۲
                                          left: size.height * 0.03,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.363,
                                            controller.svgPaths['front_wrist_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.35, // کاهش ۰.۰۲
                                          right: size.height * 0.03,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.363,
                                            controller.svgPaths['front_wrist_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Legs
                                        Positioned(
                                          top: size.height * 0.34, // کاهش ۰.۰۲
                                          left: size.height * 0.108,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.726,
                                            controller.svgPaths['front_tigh_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.34, // کاهش ۰.۰۲
                                          right: size.height * 0.108,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.726,
                                            controller.svgPaths['front_tigh_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Knees
                                        Positioned(
                                          top: size.height * 0.46, // کاهش ۰.۰۲
                                          left: size.height * 0.108,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.286,
                                            controller.svgPaths['front_knee_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.46, // کاهش ۰.۰۲
                                          right: size.height * 0.108,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.286,
                                            controller.svgPaths['front_knee_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Lower legs
                                        Positioned(
                                          top: size.height * 0.51, // کاهش ۰.۰۲
                                          left: size.height * 0.108,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.665,
                                            controller.svgPaths['front_lower_leg_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.51, // کاهش ۰.۰۲
                                          right: size.height * 0.108,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.665,
                                            controller.svgPaths['front_lower_leg_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Ankles
                                        Positioned(
                                          top: size.height * 0.61, // کاهش ۰.۰۲
                                          left: size.height * 0.10,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.363,
                                            controller.svgPaths['front_ankle_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.61, // کاهش ۰.۰۲
                                          right: size.height * 0.10,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.363,
                                            controller.svgPaths['front_ankle_R']!, color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),



                                  ),
                                  //pain types listview
                                  Container(
                                    padding: EdgeInsets.all(0.8),
                                    width:size.width*0.92- (size.height * 0.34),
                                    height: (size.height * 0.65),
                                    // color: Colors.yellow,
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      children: List.generate(
                                          controller.painTypesItem.length, (
                                          index) {
                                        final item = controller
                                            .painTypesItem[index];
                                        return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (controller.selectedIndex
                                                    .contains(item)) {
                                                  controller.selectedIndex
                                                      .remove(item);
                                                } else {
                                                  controller.selectedIndex
                                                      .add(item);
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
                                                color: controller
                                                    .selectedIndex.contains(
                                                    item)
                                                    ? Color(0xffEE4F2B)
                                                    : Color(0xff2E2F38),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: AutoSizeText(
                                                    item,
                                                    style: controller
                                                        .selectedIndex
                                                        .contains(item)
                                                        ? AppTextStyle
                                                        .selectedIndexInInjurisbodyTextStyle
                                                        : AppTextStyle
                                                        .backOrBackSelectedTextStyle,
                                                    minFontSize: 8,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                ),
                                              ),));
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  //body svg`s
                                  Container(
                                    width: size.height * 0.34,
                                    height: (size.height * 0.66),
                                    // color: Colors.blue,
                                    child:Stack(
                                      children: [

                                        // Shoulders
                                        Positioned(
                                          top: size.height * 0.06,
                                          left: size.height * 0.11,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.4,
                                            controller.svgPaths['back_shoulder_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.06,
                                          right: size.height * 0.11,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.4,
                                            controller.svgPaths['back_shoulder_R']!, color: Colors.white,
                                          ),
                                        ),
                                        
                                        // Stomach
                                        Positioned(
                                          top: size.height * 0.1,
                                          left: size.height * 0.105,
                                          child: SvgPicture.asset(
                                            height: svgHeight *1.1,
                                            controller.svgPaths['back_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.1,
                                          right: size.height * 0.105,
                                          child: SvgPicture.asset(
                                            height: svgHeight *1.1,
                                            controller.svgPaths['back_R']!, color: Colors.white,
                                          ),
                                        ),
                                        //hip
                                        Positioned(
                                          top: size.height * 0.27,
                                          left: size.height * 0.1,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.5,
                                            controller.svgPaths['back_hip_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.27,
                                          right: size.height * 0.1,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.5,
                                            controller.svgPaths['back_hip_R']!, color: Colors.white,
                                          ),
                                        ),
                                        //over hip
                                        Positioned(
                                          top: size.height * 0.223,
                                          left: size.height * 0.111,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.3,
                                            controller.svgPaths['back_over_hip_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.223,
                                          right: size.height * 0.111,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.3,
                                            controller.svgPaths['back_over_hip_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Arms
                                        Positioned(
                                          top: size.height * 0.1,
                                          left: size.height * 0.062,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.84,
                                            controller.svgPaths['back_arm_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.1,
                                          right: size.height * 0.062,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.84,
                                            controller.svgPaths['back_arm_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Forearms
                                        Positioned(
                                          top: size.height * 0.265,
                                          left: size.height * 0.039,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.53,
                                            controller.svgPaths['front_forearm_L']!, color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.265,
                                          right: size.height * 0.039,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.53,
                                            controller.svgPaths['front_forearm_R']!, color: Colors.white,
                                          ),
                                        ),

                                        // Wrists
                                        Positioned(
                                          top: size.height * 0.34,
                                          left: size.height * 0.028,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.3,
                                            controller.svgPaths['back_wrist_L']??'', color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.34,
                                          right: size.height * 0.03,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.3,
                                            controller.svgPaths['back_wrist_R']??'', color: Colors.white,
                                          ),
                                        ),

                                        // Legs
                                        Positioned(
                                          top: size.height * 0.35,
                                          left: size.height * 0.1,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.88,
                                            controller.svgPaths['back_thigh_L']??'', color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.35,
                                          right: size.height * 0.1,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.88,
                                            controller.svgPaths['back_thigh_R']??'', color: Colors.white,
                                          ),
                                        ),

                                        // elbow
                                        Positioned(
                                          top: size.height * 0.23,
                                          left: size.height * 0.05,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.25,
                                            controller.svgPaths['back_elbow_L']??'', color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.23,
                                          right: size.height * 0.05,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.25,
                                            controller.svgPaths['back_elbow_R']??'', color: Colors.white,
                                          ),
                                        ),

                                        // Lower legs
                                        Positioned(
                                          top: size.height * 0.49,
                                          left: size.height * 0.112,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.67,
                                            controller.svgPaths['back_lower_leg_L']??'', color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.49,
                                          right: size.height * 0.112,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.67,
                                            controller.svgPaths['back_lower_leg_R']??'', color: Colors.white,
                                          ),
                                        ),

                                        // Ankles
                                        Positioned(
                                          top: size.height * 0.6,
                                          left: size.height * 0.11,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.26,
                                            controller.svgPaths['back_ankle_L']??'', color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: size.height * 0.6,
                                          right: size.height * 0.11,
                                          child: SvgPicture.asset(
                                            height: svgHeight * 0.26,
                                            controller.svgPaths['back_ankle_R']??'', color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),



                                  ),
                                  //pain types listview
                                  Container(
                                    padding: EdgeInsets.all(0.8),
                                    width:size.width*0.92- (size.height * 0.34),
                                    height: (size.height * 0.65),
                                    // color: Colors.yellow,
                                    child: ListView(
                                      scrollDirection: Axis.vertical,
                                      children: List.generate(
                                          controller.painTypesItem.length, (
                                          index) {
                                        final item = controller
                                            .painTypesItem[index];
                                        return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (controller.selectedIndex
                                                    .contains(item)) {
                                                  controller.selectedIndex
                                                      .remove(item);
                                                } else {
                                                  controller.selectedIndex
                                                      .add(item);
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
                                                color: controller
                                                    .selectedIndex.contains(
                                                    item)
                                                    ? Color(0xffEE4F2B)
                                                    : Color(0xff2E2F38),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.all(8.0),
                                                  child: AutoSizeText(
                                                    item,
                                                    style: controller
                                                        .selectedIndex
                                                        .contains(item)
                                                        ? AppTextStyle
                                                        .selectedIndexInInjurisbodyTextStyle
                                                        : AppTextStyle
                                                        .backOrBackSelectedTextStyle,
                                                    minFontSize: 8,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                ),
                                              ),));
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width*0.9,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        // minimumSize: WidgetStatePropertyAll(
                        //   Size(
                        //     size.width * 0.9,
                        //     size.height * 0.05,
                        //   ),
                        // ),
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
                  ),
            
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// class ChooseInjuriesBackProfileScreen extends StatefulWidget {
//   final InjuiresScreenController controller;
//   const ChooseInjuriesBackProfileScreen({super.key, required this.controller});
//
//   @override
//   State<ChooseInjuriesBackProfileScreen> createState() =>
//       _ChooseInjuriesBackProfileScreenState();
// }
//
// class _ChooseInjuriesBackProfileScreenState
//     extends State<ChooseInjuriesBackProfileScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     return SafeArea(
//       child: Stack(
//         children: [
//           //background
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: ClipRRect(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       begin: Alignment.topRight,
//                       end: Alignment.bottomLeft,
//                       colors:
//                       AppWidgetColor.gradientBackgroundHelpQuestionScreen,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//           Scaffold(
//             appBar: GoalsAppBar(size: size),
//             backgroundColor: Colors.transparent,
//             body: Padding(
//               padding: EdgeInsets.only(
//                 top: size.height * 0.02,
//                 left: size.width * 0.04,
//                 right: size.width * 0.04,
//                 bottom: size.height * 0.04,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 spacing: size.height * 0.01,
//                 children: [
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     spacing: size.height * 0.02,
//                     children: [
//                       //title
//                       SizedBox(
//
//                         child: AutoSizeText(
//                           AppString.titleInjuriesOnboarding,
//                           style: AppTextStyle.titleGoalTextStyle,
//                           minFontSize: 10,
//                         ),
//                         height: size.height*0.07,
//                       ),
//                       //back and front button
//                       Container(
//                         color: Colors.red,
//                         height: size.height*0.05,
//                         child: Row(
//                           spacing: size.width * 0.01,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: size.height*0.05,
//
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(100)),
//                               child: Padding(
//                                 padding: EdgeInsets.fromLTRB(
//                                     size.width * 0.04,
//                                     size.height * 0.01,
//                                     size.width * 0.04,
//                                     size.height * 0.01),
//                                 child: Text(
//                                   AppString.frontChooseBodyOnboarding,
//                                   style:
//                                   AppTextStyle.frontOrBackSelectedTextStyle,
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 navigatePushReplacementWithFadeTransition(
//                                     context,
//                                     ChooseInjuriesFrontProfileScreen());
//                               },
//                               child: Container(
//                                 height: size.height*0.05,
//
//                                 decoration: BoxDecoration(
//                                   color: Colors.transparent,
//                                   borderRadius: BorderRadius.circular(100),
//                                 ),
//                                 child: Padding(
//                                   padding: EdgeInsets.fromLTRB(
//                                       size.width * 0.04,
//                                       size.height * 0.01,
//                                       size.width * 0.04,
//                                       size.height * 0.01),
//                                   child: Text(
//                                     AppString.backChooseBodyOnboarding,
//                                     style:
//                                     AppTextStyle.backOrBackSelectedTextStyle,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       Container(
//                         // color: Colors.orange,
//                           height: size.height * 0.57,
//                           child: Row(
//                             children: [
//                               //body svg`s
//                               Container(
//                                 width: size.width * 0.6,
//                                 height: size.height * 0.57,
//                                 color: Colors.blue,
//                               ),
//                               //pain types listview
//                               Container(
//                                 width: size.width * 0.3,
//                                 height: size.height * 0.57,
//                                 color: Colors.yellow,
//                                 child: ListView(
//                                   scrollDirection: Axis.vertical,
//                                   children: List.generate(widget.controller.painTypesItem.length, (index){
//                                     final item=widget.controller.painTypesItem[index];
//                                     return  GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             if (widget.controller.selectedIndex.contains(item)) {
//                                               widget.controller. selectedIndex.remove(item);
//                                             } else {
//                                               widget. controller. selectedIndex.add(item);
//                                             }
//                                           });
//                                         },
//                                         child: Container(
//                                           margin: EdgeInsets.fromLTRB(
//                                               0,
//                                               size.height * 0.005,
//                                               0,
//                                               size.height * 0.005),
//                                           width: size.width * 0.3,
//                                           height: size.height * 0.05,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                             BorderRadius.circular(100),
//                                             color:widget.controller. selectedIndex.contains(item)
//                                                 ? Color(0xffEE4F2B)
//                                                 : Color(0xff2E2F38),
//                                           ),
//                                           child: Center(
//                                             child: Padding(
//                                               padding:
//                                               const EdgeInsets.all(8.0),
//                                               child: AutoSizeText(
//                                                 item,
//                                                 style: widget.controller.selectedIndex.contains(item)
//                                                     ? AppTextStyle
//                                                     .selectedIndexInInjurisbodyTextStyle
//                                                     : AppTextStyle
//                                                     .backOrBackSelectedTextStyle,
//                                                 minFontSize: 8,
//                                                 overflow: TextOverflow.ellipsis,
//                                               ),
//                                             ),
//                                           ),));
//
//                                   }),
//                                 ),
//                               ),
//                             ],
//                           )
//
//                       ),
//                     ],
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     style: ButtonStyle(
//                       minimumSize: WidgetStatePropertyAll(
//                         Size(
//                           size.width * 0.9,
//                           size.height * 0.06,
//                         ),
//                       ),
//                       shape: WidgetStatePropertyAll(
//                         RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ),
//                       backgroundColor: WidgetStatePropertyAll(
//                         AppWidgetColor.bottomSheetBotton,
//                       ),
//                     ),
//                     child: AutoSizeText(
//                       AppString.ok,
//                       style: AppTextStyle.bottonSubmitTextStyle,
//                       minFontSize: 8,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
