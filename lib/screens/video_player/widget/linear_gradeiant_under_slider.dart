import 'package:flutter/material.dart';
import 'package:skyyoga/res/colors.dart';

class LinearGradeiantUnderSlider extends StatelessWidget {
  const LinearGradeiantUnderSlider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: size.height * 0.1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppWidgetColor.gradientColorVideoPlayerScreen,
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}
