import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/screens/exercise/screens/help_question_screen.dart';
class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _dragPosition = 5.0;
 // موقعیت کشیدن
  bool _isUnlocked = false;
 // وضعیت قفل
  final double _maxDragWidth =double.infinity;
 // حداکثر عرض قابل کشیدن
  void _onDragUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.delta.dx; // افزایش موقعیت کشیدن
      if (_dragPosition < 0) _dragPosition = 5.0; // محدودیت به سمت چپ
      if (_dragPosition > _maxDragWidth) _dragPosition = _maxDragWidth; // محدودیت به سمت راست
    });
  }

  void _onDragEnd(DragEndDetails details) {
    if (_dragPosition >=120) { // اگر 120 pixle کشیده شد
      setState(() {
        _isUnlocked = true; // قفل باز شود
        _dragPosition = 5.0; // بازگشت به حالت اولیه

        Get.to(()=>HelpQuestionScreen());
        print('Get.to');
      });
    } else {
      setState(() {
        _dragPosition = 5.0; // بازگشت به حالت اولیه
        // Get.to(HelpQuestionScreen());

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _maxDragWidth,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(35),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          // متن "Slide to unlock"
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_forward_ios,color: Colors.grey.shade50,),
              Icon(Icons.arrow_forward_ios ,color:Colors.grey.shade100,),
              Icon(Icons.arrow_forward_ios, color:Colors.grey.shade200,),
            ],
          ),

          // دکمه کشیدنی
          Positioned(
            left: _dragPosition,
            child: GestureDetector(
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color:  Colors.white,
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
