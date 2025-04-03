import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/help_question_option_widget.dart';
import 'package:skyyoga/utils/device_utility.dart';
import 'package:get/get.dart';
import '../../controllers/exercise_controllers.dart';
import '../../controllers/help_question_screen_controller.dart';
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
            child: SizedBox(
              height: AppDeviceUtils.getScreenheight() * 0.06,
              child: AutoSizeText(
                minFontSize: 12,
                maxLines: 2,
                question,
                style: AppTextStyle.helperQuestion,
              ),
            ),
          ),
          Container(
            height: AppDeviceUtils.getScreenheight() * 0.01,
          ),
          SizedBox(
            width: AppDeviceUtils.getScreenWidth() * 0.8,
            height: AppDeviceUtils.getScreenheight() * 0.68,
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
                      },
                      child: HelpQuestionOptionWidget(
                        thumbnail: options[index].thumbnail,
                        index: index,
                        videoId: options[index].videoId,
                        isSelected: options[index].isSelected,
                      ));
                }),
          ),
          Obx(() {
            final activeButton =
            options.any((element) => element.isSelected.value == true);
            return GestureDetector(
              onTap: () async {
                if (activeButton) {
                  for (var option in options) {
                    if (option.isSelected.value == true) {
                      controller.selectedOptionsVideoId.add(option.videoId);
                    }
                  }

                  if (controller.helpQuestionList.length - 1 ==
                      (controller.currentIndexForPageView.value)) {
                    final res = await controller
                        .sendAllHelpQuestionAnswersVideoId();
                    if (res) {
                      Get.back();

                      final exerciseController =
                      Get.find<ExerciseScreenController>();
                      exerciseController.isVideoIdsSaved().then((value) {
                        if (value) {
                          exerciseController.getAllSuggestedExercise();
                        } else {
                          null;
                        }
                      });

                      return;
                    } else {
                      return;
                    }
                  }

                  controller.currentIndexForPageView.value++;
                  controller.pageController.animateToPage(
                      duration: Duration(milliseconds: 300),
                      controller.currentIndexForPageView.value,
                      curve: Curves.linear);
                  print(
                      'go to page ${controller.currentIndexForPageView.value}');
                } else {
                  print('no option selected');
                  return;
                }
              },
              child: Obx(() {
                if (controller.sendingAnswersLoading.value == true) {
                  return Container(
                      decoration: BoxDecoration(
                          color: activeButton
                              ? AppWidgetColor.helpQuestionScreenContinueButton
                              : AppWidgetColor.selectGoalsScreenNotActiveButton,
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: AppDeviceUtils.getScreenWidth() * 0.9,
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return Container(
                      decoration: BoxDecoration(
                          color: activeButton
                              ? AppWidgetColor.helpQuestionScreenContinueButton
                              : AppWidgetColor.selectGoalsScreenNotActiveButton,
                          borderRadius: BorderRadius.circular(15)),
                      height: 50,
                      width: AppDeviceUtils.getScreenWidth() * 0.9,
                      child: Obx(() {
                        if(controller.sendHelpQuestionAnswersLoading.value){
                          return Center(child: CircularProgressIndicator(color: Colors.white,),);
                        }
                        return Center(
                            child: AutoSizeText(
                              minFontSize: 8,
                              AppString.continueButton,
                              style: AppTextStyle.getStartButton,
                            ));
                      }));
                }
              }),
            );
          })
        ],
      ),
    );
  }
}
