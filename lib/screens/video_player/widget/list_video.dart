import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:video_player/video_player.dart';

class ListVideo extends StatelessWidget {
  const ListVideo({
    super.key,
    required this.size,
    required this.videoUrls,
    required this.currentVideoIndex,
    required this.videoPlayerController,
    required this.videoDurations,
    required this.orientation,
  });

  final Size size;
  final List<String> videoUrls;
  final int currentVideoIndex;
  final VideoPlayerController? videoPlayerController;
  final List<Duration> videoDurations;
  final Orientation orientation;
  @override
  Widget build(BuildContext context) {
    return orientation == Orientation.portrait
        ? Container(
            constraints: BoxConstraints(
              maxWidth: double.infinity,
              maxHeight: size.height * 0.12,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videoUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    left: index == 0 ? size.width * 0.05 : size.width * 0.025,
                    right: size.width * 0.025,
                  ),
                  child: Column(
                    spacing: size.width * 0.01,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Stack(
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: size.width * 0.16,
                                maxHeight: size.width * 0.16,
                              ),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    Assets.img.png.imageVideoPlayer.path,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                    index == currentVideoIndex
                                        ? Assets.img.svg.videoIsPlay
                                        : Assets.img.svg.videoIsNotPlay),
                              ),
                            ),
                            index == currentVideoIndex
                                ? CircularPercentIndicator(
                                    reverse: true,
                                    radius: size.width * 0.08,
                                    lineWidth: 2.5,
                                    percent: videoPlayerController != null &&
                                            videoPlayerController!
                                                .value.isInitialized
                                        ? videoPlayerController!
                                                .value.position.inMilliseconds /
                                            videoDurations[currentVideoIndex]
                                                .inMilliseconds
                                        : 0.0,
                                    progressColor: Colors.white,
                                    backgroundColor: Colors.transparent,
                                  )
                                : SizedBox()
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.17,
                        child: AutoSizeText(
                          textAlign: TextAlign.center,
                          'Sky Black',
                          style: index == currentVideoIndex
                              ? AppTextStyle.titleListSelectedVideoPlayer
                              : AppTextStyle.titleListVideoPlayer,
                          minFontSize: 5,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: videoUrls.length,
            itemBuilder: (context, index) {
              return Column(
                spacing: size.height * 0.01,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left:
                          index == 0 ? size.height * 0.05 : size.height * 0.025,
                      right: size.height * 0.025,
                    ),
                    constraints: BoxConstraints(
                      maxHeight: size.height * 0.14,
                      maxWidth: size.height * 0.14,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage(
                          Assets.img.png.imageVideoPlayer.path,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            index == currentVideoIndex
                                ? Assets.img.svg.videoIsPlay
                                : Assets.img.svg.videoIsNotPlay,
                          ),
                        ),
                        index == currentVideoIndex
                            ? CircularPercentIndicator(
                                reverse: true,
                                radius: size.height * 0.07,
                                lineWidth: 2.5,
                                percent: videoPlayerController != null &&
                                        videoPlayerController!
                                            .value.isInitialized
                                    ? videoPlayerController!
                                            .value.position.inMilliseconds /
                                        videoDurations[currentVideoIndex]
                                            .inMilliseconds
                                    : 0.0,
                                progressColor: Colors.white,
                                backgroundColor: Colors.transparent,
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.14,
                    child: AutoSizeText(
                      textAlign: TextAlign.center,
                      'Sky Black',
                      style: index == currentVideoIndex
                          ? AppTextStyle.titleListSelectedVideoPlayer.apply(
                              color: Colors.white,
                            )
                          : AppTextStyle.titleListVideoPlayer.apply(
                              color: Colors.white,
                            ),
                      minFontSize: 5,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          );
  }
}
