import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/today/screens/mood_selection_screen.dart';

import '../../../res/colors.dart';
import '../../../utils/device_utility.dart';
import 'package:get/get.dart';

import '../controller/today_screen_controller.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodayScreenController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
              child: Text(
            AppString.appBarText,
            style: AppTextStyle.todayScreenAppBarTitle,
          )),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppDeviceUtils.getScreenheight() * 0.08,
                    child: AutoSizeText(
                      AppString.todayScreenTitle,
                      minFontSize: 20,
                      style: AppTextStyle.exerciseScreenTitle,
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(
                    height: AppDeviceUtils.getScreenheight() * 0.02,
                  ),
                  SizedBox(
                    // color: Colors.orange,
                    height: AppDeviceUtils.getScreenheight() * 0.05,
                    child: AutoSizeText(
                      minFontSize: 12,
                      AppString.todayScreenDescription,
                      style: AppTextStyle.exerciseScreenDescriptionStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppDeviceUtils.getScreenheight() * 0.01,
            ),
            SizedBox(
              width: double.infinity,
              height: AppDeviceUtils.getScreenheight() * 0.5,
              child: Assets.img.png.yogaPerson.image(),
            ),
            SizedBox(
              height: AppDeviceUtils.getScreenheight() * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppDeviceUtils.getScreenWidth() * 0.05,
              ),
              child: GestureDetector(
                onTap: () {

                  controller.sendFeelingAnswersLoading.value = false;

                  for (var item in controller.allPainArea) {
                    item.isSelected.value = false;
                  }

                  controller.selectedMood.value = '';
                  controller.question1currentAnswerValue.value = 40.0;
                  controller.question2currentAnswerValue.value = 15.0;

                  Get.to(MoodSelectionScreen());
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppWidgetColor.todayScreenGetStartBackGround,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(AppString.todayGetStartButton,
                        style: AppTextStyle.titleBottomSheetTextStyle),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
