import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:video_player/video_player.dart';

class PlayBottom extends StatelessWidget {
  const PlayBottom({
    super.key,
    required this.videoPlayerController,
    required this.size,
    required this.orientation,
  });
  final Size size;
  final Orientation orientation;

  final VideoPlayerController? videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  videoPlayerController?.value.isPlaying ?? false
                      ? SvgPicture.asset(
                          Assets.img.svg.pauseVideo,
                          height: 29,
                        )
                      : SvgPicture.asset(
                          Assets.img.svg.playVideo,
                          height: 29,
                          width: 29,
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
