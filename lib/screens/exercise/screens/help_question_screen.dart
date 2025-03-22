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
    return Stack(
      children:[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end:Alignment.bottomLeft,
                colors: [
              AppWidgetColor.helpQuestionScreenbackgroundColor,
              AppWidgetColor.helpQuestionScreenbackgroundColor,
              AppWidgetColor.helpQuestionScreenbackgroundColor2,
              AppWidgetColor.helpQuestionScreenbackgroundColor2,
              AppWidgetColor.helpQuestionScreenbackgroundColor2,
              AppWidgetColor.helpQuestionScreenbackgroundColor2,

            ])
          ),
        ),
       SafeArea(
         child: Scaffold(
          appBar: AppBar(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            leading: IconButton(
                onPressed: (){
                  Get.back();
                  print('back to exercise screen');
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            title: Text('Sky'),
          ),
          backgroundColor:Colors.transparent,
          bottomNavigationBar: SizedBox(
            height: 50,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(bottom: 5,left: 15,right: 15),
              //Continue button
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppWidgetColor
                        .helpQuestionScreenContinueButton, // Change button background color
                    foregroundColor: Colors.white, // Change text color
                    elevation: 5, // Add shadow
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // Rounded corners
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Continue')),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0),
            child: Column(
         
              children: [
                Container(
                  color: Colors.transparent,
                  height: AppDeviceUtils.getScreenheight()*0.74,
                  width: AppDeviceUtils.getScreenWidth(),
                  child: PageView.builder(
                      itemCount:
                          helpQuestionScreenController.helpQuestionItemList.length,
                      itemBuilder: (context, index) {
                        final questionItem =
                            helpQuestionScreenController.helpQuestionItemList[index];
                        return HelpQuestionWidget(
                          question: questionItem.question,
                          options: questionItem.options,
                        );
                      }),
                ),
              ],
            ),
          ),
               ),
       ),
      ]
    );
  }
}
