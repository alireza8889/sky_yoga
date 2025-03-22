import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/screens/progress/models/goal_level_thumbnail_model.dart';
import 'package:skyyoga/utils/device_utility.dart';

class GoalLevelThumbnailWidget extends StatelessWidget {
  final String imageUrl;
  final String levelStatus;
  final int levelNumber;
  const GoalLevelThumbnailWidget(
      {super.key,
      required this.imageUrl,
      required this.levelStatus,
      required this.levelNumber});

  @override
  Widget build(BuildContext context) {
    final bool isPassed = (levelStatus == GoalLevelStatus.passed.toString());
    final bool isLock = (levelStatus == GoalLevelStatus.locked.toString());
    final bool isProcessing =
        (levelStatus == GoalLevelStatus.inProcess.toString());
final double thumbnailHeight=AppDeviceUtils.getScreenWidth()*0.185;
final double thumbnailWidth=AppDeviceUtils.getScreenWidth()*0.185;
final double borderRadius=10;
    return Container(
      height: thumbnailHeight,
      width: thumbnailWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius)
      ),
      child: Stack(children: [
        //blur

//image thumbnail
        Container(
          height: thumbnailHeight,
          width: thumbnailWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),

            // color: Colors.orangeAccent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Stack( // Use Stack to layer the image and blur
              children: [
                CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imageUrl,
                ),
              !isProcessing?  Positioned.fill( // Cover the entire image with the blur
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), // Adjust blur intensity
                    child: Container(

                      color: Colors.black.withOpacity(0.3), // Transparent background for the filter
                    ),
                  ),
                ):SizedBox(),
              ],
            ),
          ),
        ),

        !isProcessing
            ? Container(
          height: thumbnailHeight,
          width: thumbnailWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              isPassed
                  ? Icon(Icons.check_circle_outline,color: Colors.white,)
                  : isLock
                  ? Icon(Iconsax.lock,color: Colors.white,)
                  : SizedBox(),
              AutoSizeText(
                minFontSize: 7,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white
                  ),
                  'Level${levelNumber.toString()}')
            ],
          ),
        )
            : SizedBox(),
        isPassed || isLock
            ? Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),

          ),
          height: thumbnailHeight,
          width: thumbnailWidth,
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),
        )
            : SizedBox(),
      ]),
    );
  }
}
