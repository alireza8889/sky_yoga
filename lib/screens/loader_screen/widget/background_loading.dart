import 'package:flutter/material.dart';
import 'package:skyyoga/res/colors.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: AppWidgetColor.bgColorLoaderVideoScreen,
          ),
        ),
      ),
    );
  }
}
