import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/today/controller/today_screen_controller.dart';
import 'package:skyyoga/widget/loading_widget.dart';

class MoodSelectionScreen extends StatefulWidget {
  const MoodSelectionScreen({
    super.key,
  });

  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodayScreenController());
    controller.getAllMoodsForSelectMoodScreen();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppWidgetColor.selectMoodsScreenGradient,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 50), // Adjust spacing for status bar
                Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Obx(() {
                  if(controller.getMoodsLoading.value){
                    return Expanded(child: Center(child: LoadingWidget(height: 100, width: 100)),);
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.allMoods.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GestureDetector(
                            onTap: () {
          
                                controller.selectedMood.value =
                                controller.allMoods[index].value;
          
                            },
                            child: Obx(() {
                              final isSelected = controller.selectedMood
                                  .value ==
                                  controller.allMoods[index].value;
                              return Container(
                                decoration: BoxDecoration(
                                  gradient: isSelected
                                      ? LinearGradient(
                                      colors: AppWidgetColor
                                          .selectMoodsButtonGradient)
                                      : null,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Text(
                                  controller.allMoods[index].displayName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  );
                }),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      // Handle mood selection
                      if (controller.selectedMood.isNotEmpty) {
                        Get.back();
                        controller.currentQuestionNumber.value = 1;
                        controller.bottomSheetContainerHeightFactor.value = 0.4;
                        controller.showSelectUserLimitBottomSheet();
                      } else {
                        null;
                      }
                    },
                    child: Obx(() {
                      final activeButton = controller.selectedMood.isNotEmpty;
                      return Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: activeButton
                                  ? AppWidgetColor.setMoodActiveButtonBackGround
                                  : AppWidgetColor
                                  .setMoodUnActiveButtonBackGround,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                              child: Text(
                                AppString.setMoodButton,
                                style: AppTextStyle.setMoodButtonTextStyle,
                              )));
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
