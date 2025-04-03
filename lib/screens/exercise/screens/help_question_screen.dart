import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/help_question_widget.dart';
import 'package:skyyoga/utils/device_utility.dart';

import '../controllers/help_question_screen_controller.dart';

class HelpQuestionScreen extends StatelessWidget {
  final HelpQuestionScreenController helpQuestionScreenController;
  const HelpQuestionScreen(
      {super.key, required this.helpQuestionScreenController});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: AppWidgetColor.gradientBackgroundHelpQuestionScreen,
          ),
        ),
      ),
      SafeArea(
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            title: Text(AppString.appBarText),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: AppDeviceUtils.getScreenheight() * 0.83,
                  width: AppDeviceUtils.getScreenWidth(),
                  child: Obx(() {
                    if (helpQuestionScreenController
                            .helpQuestionScreenIsLoading.value ==
                        true) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return PageView.builder(
                        controller: helpQuestionScreenController.pageController,
                        itemCount: helpQuestionScreenController
                            .helpQuestionList.length,
                        itemBuilder: (context, index) {
                          return Obx(() {
                            final optionItems = helpQuestionScreenController
                                .helpQuestionList[index];
                            return HelpQuestionWidget(
                              controller: helpQuestionScreenController,
                              question:
                                  'Tell us what you can do and we`ll help you to grow ',
                              options: optionItems.options,
                            );
                          });
                        });
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
