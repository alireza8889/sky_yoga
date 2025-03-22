import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';

class AppBarVideoPlayer extends StatefulWidget {
  const AppBarVideoPlayer({
    super.key,
    required this.size,
    required this.orientation,
  });

  final Size size;
  final Orientation orientation;

  @override
  State<AppBarVideoPlayer> createState() => _AppBarVideoPlayerState();
}

bool isLandscape = true;

class _AppBarVideoPlayerState extends State<AppBarVideoPlayer> {
  void toggleOrientation() {
    setState(() {
      isLandscape = !isLandscape;
    });

    if (isLandscape) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
    } else {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.size.height * 0.02,
      right: widget.size.width * 0.05,
      left: widget.size.width * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // ignore: avoid_print
              !isLandscape ? toggleOrientation() : print('isLanscape is true');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: widget.orientation == Orientation.portrait
                        ? widget.size.width * 0.15
                        : widget.size.height * 0.15,
                    minHeight: widget.orientation == Orientation.portrait
                        ? widget.size.width * 0.07
                        : widget.size.height * 0.07,
                    maxWidth: widget.orientation == Orientation.portrait
                        ? widget.size.width * 0.15
                        : widget.size.height * 0.15,
                    minWidth: widget.orientation == Orientation.portrait
                        ? widget.size.width * 0.07
                        : widget.size.height * 0.07,
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
                          SvgPicture.asset(Assets.img.svg.arrowLeft),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            spacing: widget.orientation == Orientation.portrait
                ? widget.size.width * 0.06
                : 0,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: widget.orientation == Orientation.portrait
                          ? widget.size.width * 0.15
                          : widget.size.height * 0.15,
                      minHeight: widget.orientation == Orientation.portrait
                          ? widget.size.width * 0.07
                          : widget.size.height * 0.07,
                      maxWidth: widget.orientation == Orientation.portrait
                          ? widget.size.width * 0.15
                          : widget.size.height * 0.15,
                      minWidth: widget.orientation == Orientation.portrait
                          ? widget.size.width * 0.07
                          : widget.size.height * 0.07,
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
                            SvgPicture.asset(Assets.img.svg.mirroringScreen),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              !isLandscape
                  ? ClipRRect()
                  : GestureDetector(
                      onTap: () => toggleOrientation(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight:
                                  widget.orientation == Orientation.portrait
                                      ? widget.size.width * 0.15
                                      : widget.size.height * 0.15,
                              minHeight:
                                  widget.orientation == Orientation.portrait
                                      ? widget.size.width * 0.07
                                      : widget.size.height * 0.07,
                              maxWidth:
                                  widget.orientation == Orientation.portrait
                                      ? widget.size.width * 0.15
                                      : widget.size.height * 0.15,
                              minWidth:
                                  widget.orientation == Orientation.portrait
                                      ? widget.size.width * 0.07
                                      : widget.size.height * 0.07,
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
                                    SvgPicture.asset(Assets.img.svg.maximize),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          )
        ],
      ),
    );
  }
}
