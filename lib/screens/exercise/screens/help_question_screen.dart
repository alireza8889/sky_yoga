import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/exercise/controllers/help_question_screen_controller.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/help_question_widget.dart';
import 'package:skyyoga/utils/device_utility.dart';

class HelpQuestionScreen extends StatelessWidget {
  const HelpQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final helpQuestionScreenController =
        Get.put(HelpQuestionScreenController());
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: AppWidgetColor.gradientBackgroundHelpQuestionScreen,
        )),
      ),
      SafeArea(
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                  print('back to exercise screen');
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            title: Text('Sky'),
          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Column(
              children: [
                Container(
                  // color: Colors.green,
                  height: AppDeviceUtils.getScreenheight() * 0.83,
                  width: AppDeviceUtils.getScreenWidth(),
                  child: Obx(() {


                      final optionItems =
                          helpQuestionScreenController.helpQuestionList;
                      return PageView.builder(
                          controller:
                              helpQuestionScreenController.pageController,
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
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
