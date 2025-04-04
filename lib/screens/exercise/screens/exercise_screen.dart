import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemChrome, SystemUiOverlayStyle;
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/exercise/controllers/help_question_screen_controller.dart' show HelpQuestionScreenController;
// import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/past_exercise_widget.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/suggested_exercises_widget.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/slider_widget.dart';
import 'package:skyyoga/utils/device_utility.dart';
import 'package:get/get.dart';

import '../../../widget/loading_widget.dart';
import '../controllers/exercise_controllers.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseController = Get.put(ExerciseScreenController());
    final helpQuestionController = Get.put(HelpQuestionScreenController());

    // final showPastExercise = exerciseController.pastExercises.isNotEmpty;
    // final listOfLikedPastExercise=  exerciseController.getLikedPastExercises();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white, // یا Colors.transparent
      ),
    );
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          bottom: 0.0,
          left: AppDeviceUtils.getScreenWidth() * 0.04,
          right: AppDeviceUtils.getScreenWidth() * 0.04,
          // top: AppDeviceUtils.getScreenheight() * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDeviceUtils.getScreenheight() * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppDeviceUtils.getScreenheight() * 0.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppDeviceUtils.getScreenheight() * 0.05,
                          child: AutoSizeText(
                            AppString.exerciseTilte,
                            minFontSize: 17,
                            maxFontSize: 20,
                            style: AppTextStyle.exerciseScreenTitle,
                            maxLines: 1,
                          ),
                        ),
                        SizedBox(
                          height: AppDeviceUtils.getScreenheight() * 0.05,
                          child: AutoSizeText(
                            minFontSize: 12,
                            maxFontSize: 20,
                            AppString.exerciseDescription,
                            style: AppTextStyle.exerciseScreenDescriptionStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDeviceUtils.getScreenheight() * 0.02,
                  ),
                  Obx(() {
                    return Container(
                        width: double.infinity,
                        height: AppDeviceUtils.getScreenheight() * 0.35,
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                            color: exerciseController
                                .isAllHelpQuestionAnswered.value ==
                                false
                                ? AppWidgetColor.sliderBoxBackground
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Obx(() {
                          if (exerciseController.isAllHelpQuestionAnswered ==
                              false.obs) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height:
                                    AppDeviceUtils.getScreenheight() * 0.08,
                                  ),
                                  Container(
                                    height:
                                    AppDeviceUtils.getScreenheight() * 0.1,
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                    child: AutoSizeText(
                                      minFontSize: 11,
                                      maxLines: 2,
                                      AppString.toUnlockDescription,
                                      style: AppTextStyle
                                          .toUnlockDescripthyionStyle,
                                    ),
                                  ),
                                  SliderWidget(
                                    helpQuestionScreenController:
                                    helpQuestionController,
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return SuggestedExercisesWidget(
                              exerciseScreenController: exerciseController,
                            );
                          }
                        }));
                  }),
                ],
              ),
            ),
            SizedBox(
              height: AppDeviceUtils.getScreenheight() * 0.03,
              child: AutoSizeText(
                AppString.pastExercise,
                style: AppTextStyle.exerciseScreenTitle,
                minFontSize: 15,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

                 Obx(() {
                   if(exerciseController.pastExercises.isNotEmpty){
                     return Container(
                       // color: Colors.red,

                       height: AppDeviceUtils.getScreenheight() * 0.01,
                     );
                   }else
                     {
                       return               SizedBox(
                         height: AppDeviceUtils.getScreenheight() * 0.04,
                         child: AutoSizeText(
                           minFontSize: 8,
                           maxFontSize: 17,
                           AppString.pastExerciseDescription,
                           style: AppTextStyle.exerciseScreenDescriptionStyle,
                         ),
                       );
                     }

            }),

            Obx(() {
              if (exerciseController.pastExerciseLoading.value) {
                return Center(child: LoadingWidget(height: 100, width: 100));
              }
              return SizedBox(
                width: double.infinity,
                height: exerciseController.pastExercises.isNotEmpty
                    ? AppDeviceUtils.getScreenheight() * 0.33
                    : AppDeviceUtils.getScreenheight() * 0.31,
                child: exerciseController.pastExerciseLoading.value
                    ? SizedBox(
                    height: AppDeviceUtils.getScreenWidth() * 0.1,
                    width: AppDeviceUtils.getScreenWidth() * 0.1,
                    child: LoadingWidget(
                      height: AppDeviceUtils.getScreenWidth() * 0.1,
                      width: AppDeviceUtils.getScreenWidth() * 0.1,
                    ))
                    : exerciseController.pastExercises.isNotEmpty
                    ? SizedBox(
                    height: exerciseController.pastExercises.isNotEmpty
                        ? AppDeviceUtils.getScreenheight() * 0.33
                        : AppDeviceUtils.getScreenheight() * 0.31,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                            exerciseController.pastExercises.length,
                                (index) {
                              final pastExerciseModel =
                              exerciseController.pastExercises[index];

                              if (exerciseController.pastExercises.length -
                                  1 ==
                                  index) {
                                //make space under last item
                                return Column(
                                  children: [
                                    PastExerciseWidget(
                                      controller: exerciseController,
                                      pastExerciseModel: pastExerciseModel,
                                    ),
                                    SizedBox(
                                      height: 100,
                                    )
                                  ],
                                );
                              }
                              //
                              return PastExerciseWidget(
                                controller: exerciseController,
                                pastExerciseModel: pastExerciseModel,
                              );
                            }),
                      ),
                    ))
                    : Center(
                  child: Icon(
                    Iconsax.lamp_charge4,
                    size: AppDeviceUtils.getScreenheight() * 0.05,
                    color: Colors.grey,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
