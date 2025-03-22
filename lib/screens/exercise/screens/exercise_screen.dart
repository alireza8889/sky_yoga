import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_strings.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/exercise/controllers/exercise_controllers.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/past_exercise_widget.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/suggested_exercises_widget.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/slider_widget.dart';
import 'package:skyyoga/utils/device_utility.dart';
import 'package:get/get.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseController = Get.put(ExerciseScreenController());
    final showPastExercise = exerciseController.pastExercises.isNotEmpty;
    final showSuggestedExercise =
        !(exerciseController.allSuggestedExercise.isNotEmpty &&
            exerciseController.allSuggestedExercise.isNotEmpty);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 0.0, left: 30, right: 30, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // color: Colors.red,
              height: AppDeviceUtils.getScreenheight() * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    // color: Colors.blue,

                    height: AppDeviceUtils.getScreenheight() * 0.1,
                    //title and description
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: AutoSizeText(
                            AppTexts.exerciseTilte,
                            minFontSize: 17,
                            maxFontSize: 20,
                            style: AppTextStyle.exerciseScreenTitle,
                            maxLines: 1,
                          ),
                          // color: Colors.green,
                          height: AppDeviceUtils.getScreenheight() * 0.05,
                        ),
                        // SizedBox(height: AppDeviceUtils.getScreenheight()*0.01,),
                        Container(
                          // color: Colors.orange,
                          height: AppDeviceUtils.getScreenheight() * 0.05,
                          child: AutoSizeText(
                            minFontSize: 12,
                            maxFontSize: 20,
                            AppTexts.exerciseDescription,
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

                  Container(
                      height: AppDeviceUtils.getScreenheight() * 0.35,
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                          color: !showSuggestedExercise
                              ? AppWidgetColor.suggestedBox
                              : null,
                          borderRadius: BorderRadius.circular(10)),
                      child: !showSuggestedExercise
                          //if help question not answered
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    // color: Colors.purple,
                                    height:
                                        AppDeviceUtils.getScreenheight() * 0.08,
                                  ),
                                  Container(
                                    // color: Colors.yellow,
                                    height:
                                        AppDeviceUtils.getScreenheight() * 0.1,
                                    child: AutoSizeText(
                                      minFontSize: 11,
                                      maxLines: 2,
                                      AppTexts.toUnlockDescription,
                                      style:
                                          AppTextStyle.toUnlockDescriptionStyle,
                                    ),
                                  ),
                                  SliderWidget(),
                                ],
                              ),
                            )
                          : SuggestedExercisesWidget(
                              exerciseScreenController: exerciseController,
                              // exerciseScreenController: exerciseController,
                            )),
                  //
                ],
              ),
            ),
            SizedBox(
              // color: Colors.yellow,
              height: AppDeviceUtils.getScreenheight() * 0.4,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    // color: Colors.green,
                    height: showPastExercise
                        ? AppDeviceUtils.getScreenheight() * 0.04
                        : AppDeviceUtils.getScreenheight() * 0.08,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: AppDeviceUtils.getScreenheight() * 0.04,
                          child: AutoSizeText(
                            AppTexts.pastExercise,
                            style: AppTextStyle.exerciseScreenTitle,
                            minFontSize: 15,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // color: Colors.red,
                        ),
                        showPastExercise
                            ? SizedBox()
                            : Container(
                                height: AppDeviceUtils.getScreenheight() * 0.04,
                                // color: Colors.purple,
                                child: AutoSizeText(
                                  minFontSize: 8,
                                  maxFontSize: 17,
                                  AppTexts.pastExerciseDescription,
                                  style: AppTextStyle
                                      .exerciseScreenDescriptionStyle,
                                ),
                              )
                      ],
                    ),
                  ),
                  SizedBox(
                    // color: Colors.yellow,
                    height: showPastExercise
                        ? AppDeviceUtils.getScreenheight() * 0.34
                        : AppDeviceUtils.getScreenheight() * 0.31,
                    child: showPastExercise
                        ? SizedBox(
                            height: AppDeviceUtils.getScreenheight() * 0.35,
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(
                                    exerciseController.pastExercises.length,
                                    (index) {
                                  final pastExerciseModel =
                                      exerciseController.pastExercises[index];

                                  return PastExerciseWidget(
                                    pastExerciseModel: pastExerciseModel,
                                  );
                                }),
                              ),
                            ),
                            // child: ListView.builder(
                            //     itemCount:
                            //         exerciseController.pastExercises.length,
                            //     itemBuilder: (context, index) {
                            //       final pastExerciseModel =
                            //           exerciseController.pastExercises[index];
                            //       return PastExerciseWidget(
                            //         pastExerciseModel: pastExerciseModel,
                            //       );
                            //     }),
                          )
                        : Center(
                            child: Icon(
                              Iconsax.lamp_charge4,
                              size: 60,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
