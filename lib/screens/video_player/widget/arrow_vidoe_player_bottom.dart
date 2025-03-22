import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:skyyoga/res/colors.dart';

class Arrow30MinBottom extends StatelessWidget {
  final Size size;
  final String image;
  final Orientation orientation;
  const Arrow30MinBottom({
    super.key,
    required this.size,
    required this.image,
    required this.orientation,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15.0,
          sigmaY: 15.0,
        ),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: orientation == Orientation.portrait
                ? size.width * 0.15
                : size.height * 0.15,
            minHeight: orientation == Orientation.portrait
                ? size.width * 0.07
                : size.height * 0.07,
            maxWidth: orientation == Orientation.portrait
                ? size.width * 0.15
                : size.height * 0.15,
            minWidth: orientation == Orientation.portrait
                ? size.width * 0.07
                : size.height * 0.07,
          ),
          decoration: BoxDecoration(
            color: AppWidgetColor.bottonVideoPlayerColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    image,
                    height: orientation == Orientation.portrait
                        ? size.width * 0.075
                        : size.height * 0.075,
                    width: orientation == Orientation.portrait
                        ? size.width * 0.075
                        : size.height * 0.075,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
