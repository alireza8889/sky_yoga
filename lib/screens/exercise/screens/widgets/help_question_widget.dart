import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:skyyoga/components/text_strings.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/exercise/controllers/help_question_screen_controller.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/help_question_option_widget.dart';
import 'package:skyyoga/utils/device_utility.dart';

import '../../models/help_question_option_model.dart';

class HelpQuestionWidget extends StatelessWidget {
  final HelpQuestionScreenController controller;
  final String question;
  final List<HelpQuestionOptionModel> options;

  const HelpQuestionWidget({
    super.key,
    required this.question,
    required this.options,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(
              // color: Colors.orange,
              height: AppDeviceUtils.getScreenheight() * 0.07,
              // padding: EdgeInsets.symmetric(horizontal: 8.0),
              // color: Colors.green,
              child: AutoSizeText(
                minFontSize: 12,
                maxLines: 2,
                question,
                style: AppTextStyle.helperQuestion,
              ),
            ),
          ),
          Container(
            // color: Colors.blue,
            height: AppDeviceUtils.getScreenheight() * 0.02,
          ),
          SizedBox(
            // color: Colors.yellow,
            width: AppDeviceUtils.getScreenWidth() * 0.8,
            height: AppDeviceUtils.getScreenheight() * 0.64,
            child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        for (var option in options) {
                          option.isSelected.value = false;
                        }
                        options[index].isSelected.value =
                            !options[index].isSelected.value;
                        // controller.selectedOptionsVideoId
                        //     .add(options[index].videoId);
                      },
                      child: HelpQuestionOptionWidget(
                        thumbnail: options[index].thumbnail,
                        index: index,
                        videoId: options[index].videoId,
                        isSelected: options[index].isSelected,
                      ));
                }),
          ),

          //continue button
          Obx(() {
            final activeButton =
                options.any((element) => element.isSelected.value == true);
            return GestureDetector(
              onTap: () async {
                if (activeButton) {
                  for (var option in options) {
                    if (option.isSelected.value == true) {
                      controller.selectedOptionsVideoId.add(option.videoId);
                      print('option video id added   ${option.videoId}');
                    }
                  }

                  //for last PageView index
                  //send all selected videoIds
                  if (controller.helpQuestionList.length ==
                      (controller.currentIndexForPageView.value)) {
                    final res = await controller.sendAllVideoIds();
                    if (res) {
                      //all videoIds send successfully
                      // Get.back();
                      return;
                    } else {
                      //video ids not send


                      return;
                    }
                  }


                  //pageview navigate
                  controller.currentIndexForPageView.value++;
                  controller.pageController
                      .jumpToPage(controller.currentIndexForPageView.value);
                  print(
                      'go to page ${controller.currentIndexForPageView.value}');
                } else {
                  print('no option selected');
                  return;
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: activeButton
                        ? AppWidgetColor.helpQuestionScreenContinueButton
                        : AppWidgetColor.selectGoalsScreenNotActiveButton,
                    borderRadius: BorderRadius.circular(15)),
                height: 50,
                width: AppDeviceUtils.getScreenWidth() * 0.9,
                child: Center(
                    child: Text(
                  AppTexts.continueButton,
                  style: TextStyle(color: Colors.white),
                )),
              ),
            );
          })
        ],
      ),
    );
  }
}
