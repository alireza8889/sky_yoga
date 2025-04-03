import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/exercise/controllers/help_question_screen_controller.dart' show HelpQuestionScreenController;

import '../help_question_screen.dart';



class SliderWidget extends StatefulWidget {
  final HelpQuestionScreenController helpQuestionScreenController;

  const SliderWidget({super.key, required this.helpQuestionScreenController});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double dragPosition = 5.0;
  bool isUnlocked = false;
  final double _maxDragWidth = double.infinity;
  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition += details.delta.dx;
      if (dragPosition < 0) dragPosition = 5.0;
      if (dragPosition > _maxDragWidth) dragPosition = _maxDragWidth;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (dragPosition >= 120) {
      setState(() {
        isUnlocked = true;
        dragPosition = 5.0;
        widget.helpQuestionScreenController.currentIndexForPageView.value = 0;
        for(var helpQuestion in widget.helpQuestionScreenController.helpQuestionList ){
          for(var option in helpQuestion.options){
            option.isSelected.value=false;
          }
        }
      }
        );

        Get.to(() => HelpQuestionScreen(
              helpQuestionScreenController: widget.helpQuestionScreenController,
            ));

    } else {
      setState(() {
        dragPosition = 5.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _maxDragWidth,
      height: 60,
      decoration: BoxDecoration(
        color: AppWidgetColor.sliderBackground,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Icon(
                size: 12,

                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.2),
              ),
              SizedBox(width: 5,),

              Icon(
                size: 12,
                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.4),
              ),
              SizedBox(width: 5,),
              Icon(
                size: 12,

                Icons.arrow_forward_ios,
                color: Colors.white.withOpacity(0.8),
              ),
              SizedBox(width: 5,),

            ],
          ),
          Positioned(
            left: dragPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Iconsax.lock,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            right: 5,
            child: GestureDetector(
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Iconsax.unlock,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
