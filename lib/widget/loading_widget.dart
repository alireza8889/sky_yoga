import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final double height;
  final double width;
  const LoadingWidget({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
color: Colors.transparent,
      child: Lottie.asset( height: height,
          width: width,
          'assets/lottie/json/loading.json'),
    );
  }
}
