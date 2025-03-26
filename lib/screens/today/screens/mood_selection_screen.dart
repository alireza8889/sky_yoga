import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_strings.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/today/controller/select_mood_controller.dart';

class MoodSelectionScreen extends StatefulWidget {
  const MoodSelectionScreen({super.key});

  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SelectMoodController());
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              Expanded(
                child: ListView.builder(
                  itemCount: controller.moods.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.selectedMood.value =
                            controller.moods[index];
                          });
                        },
                        child: Obx(() {
                          final isSelected=controller.selectedMood.value ==
                              controller.moods[index];
                          return Container(
                            decoration: BoxDecoration(
                              gradient: isSelected
                                  ? LinearGradient(

                                  colors:

                                  AppWidgetColor.selectMoodsButtonGradient)
                                  : null,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              controller.moods[index],
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
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 16.0),
                child: GestureDetector(
                  onTap: controller.selectedMood.isNotEmpty
                      ? () {
                    // Handle mood selection
                    print('Selected mood: ${controller.selectedMood.value}');
                  }
                      : null,
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: AppWidgetColor.setMoodButtonBackGround,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text(AppTexts.setMoodButton,
                        style: AppTextStyle.setMoodButtonTextStyle,))),

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
