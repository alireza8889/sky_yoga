import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/screens/today/controller/today_screen_controller.dart';

import '../../../components/text_strings.dart';
import '../../../res/colors.dart';
import '../../../utils/device_utility.dart';
import 'package:get/get.dart';

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
          'Sky',
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
                    AppTexts.todayScreenTitle,
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
                    AppTexts.todayScreenDescription,
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
            // color: Colors.blue,
            height: AppDeviceUtils.getScreenheight() * 0.5,
            child: Image.asset('assets/img/png/yoga_person.png'),
          ),
          SizedBox(
            height: AppDeviceUtils.getScreenheight() * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GestureDetector(
              onTap: () {
                controller.showSelectUserLimitBottomSheet();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppWidgetColor.todayScreenGetStartBackGround,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  AppTexts.todayGetStartButton,
                  style: TextStyle(color: AppTextColor.getStartButtonText),
                )),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
