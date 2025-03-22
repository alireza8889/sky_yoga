import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skyyoga/gen/assets.gen.dart';

class LoadingLogo extends StatelessWidget {
  final Size size;
  const LoadingLogo({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: size.width,
          maxWidth: size.width,
        ),
        child: LottieBuilder.asset(
          Assets.lottie.json.loader,
        ),
      ),
    );
  }
}
