import 'dart:async';
import 'dart:ui';

import 'package:audio_session/audio_session.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/data/video_fake_data.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/video_player/widget/app_bar_video_player.dart';
import 'package:skyyoga/screens/video_player/widget/arrow_vidoe_player_bottom.dart';
import 'package:skyyoga/screens/video_player/widget/category_list.dart';
import 'package:skyyoga/screens/video_player/widget/description_video_player.dart';
import 'package:skyyoga/screens/video_player/widget/glowing_slider_thumb.dart';
import 'package:skyyoga/screens/video_player/widget/linear_gradeiant_under_slider.dart';
import 'package:skyyoga/screens/video_player/widget/list_video.dart';
import 'package:skyyoga/screens/video_player/widget/loading_video_widget.dart';
import 'package:skyyoga/screens/video_player/widget/play_bottom.dart';
import 'package:skyyoga/screens/video_player/widget/title_video_player.dart';
import 'package:skyyoga/screens/video_player/widget/vertical_music_player_bottom.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final AudioPlayer audioPlayer = AudioPlayer();
  VideoPlayerController? videoPlayerController;
  int currentVideoIndex = 0;
  Duration totalElapsedTime = Duration.zero;
  Duration totalDuration = Duration.zero;
  List<Duration> videoDurations = [];
  bool isPlay = false;
  bool initialPlay = true;
  bool firstPlay = false;
  bool showIcon = false;
  Duration? duration;
  double volume = 0.5;
  double videoVolume = 0.5;
  double musicVolume = 0.5;
  String musicLinkData = 'assets/audio/Sunday.mp3';

  List<String> videoUrls = [
    'assets/video/video1.mp4',
    'assets/video/video2.mp4',
  ];

  void loadMusic() {
    audioPlayer
        .setAsset(
      musicLinkData,
    )
        .then(
      (value) {
        audioPlayer.play();
        audioPlayer.setVolume(musicVolume);
      },
    );
  }

  void changeVolumeMusic(double volume) {
    setState(() {
      musicVolume = volume;
      audioPlayer.setVolume(musicVolume);
    });
  }

  void onClicked() {
    setState(() {
      showIcon = !showIcon;
    });
  }

  @override
  void initState() {
    super.initState();
    loadMusic();
    initializeVideos();
    audioPlayer.positionStream.listen((position) {
      setState(() {
        if (audioPlayer.playing) {
          if (audioPlayer.position.inSeconds >=
              audioPlayer.duration!.inSeconds) {
            audioPlayer.pause();
          }
        }
      });
    });
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  void changeVolumeVideo(double value) {
    setState(
      () {
        videoPlayerController != null &&
                videoPlayerController!.value.isInitialized
            ? {
                videoVolume = value,
                videoPlayerController!.setVolume(videoVolume)
              }
            : volume = value;
      },
    );
  }

  void seekForward() {
    if (videoPlayerController != null) {
      Duration newPosition = totalElapsedTime + Duration(seconds: 30);
      if (newPosition > totalDuration) {
        newPosition = totalDuration;
      }
      seekToPosition(newPosition);
    }
  }

  void seekBackward() {
    if (videoPlayerController != null) {
      Duration newPosition = totalElapsedTime - Duration(seconds: 30);
      if (newPosition < Duration.zero) {
        newPosition = Duration.zero;
      }
      seekToPosition(newPosition);
    }
  }

  void seekToPosition(Duration newPosition) {
    Duration accumulated = Duration.zero;
    for (int i = 0; i < videoDurations.length; i++) {
      if (newPosition < accumulated + videoDurations[i]) {
        Duration seekInVideo = newPosition - accumulated;
        setState(() {
          currentVideoIndex = i;
        });
        loadVideo(i, seekInVideo);
        break;
      }
      accumulated += videoDurations[i];
    }
  }

  Future<void> initializeVideos() async {
    totalDuration = Duration.zero;
    for (String url in videoUrls) {
      VideoPlayerController tempController = VideoPlayerController.asset(url);
      await tempController.initialize();
      videoDurations.add(tempController.value.duration);
      totalDuration += tempController.value.duration;
      await tempController.dispose();
    }
    loadVideo(0, Duration.zero);
    setState(() {});
  }

  void loadVideo(int index, Duration startPosition) {
    videoPlayerController?.dispose();
    videoPlayerController = VideoPlayerController.asset(videoUrls[index],
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true))
      ..initialize().then((_) {
        videoPlayerController!.seekTo(startPosition);

        if (isPlay) {
          videoPlayerController!.play();
        }
        videoPlayerController!.addListener(videoListener);
        setState(() {});
      })
      ..setVolume(videoVolume);
  }

  void videoListener() {
    Duration elapsedTime = Duration.zero;
    for (int i = 0; i < currentVideoIndex; i++) {
      elapsedTime += videoDurations[i];
    }
    setState(() {
      totalElapsedTime = elapsedTime + videoPlayerController!.value.position;
    });

    if (videoPlayerController!.value.position >=
        videoPlayerController!.value.duration) {
      playNextVideo();
    }
  }

  void playNextVideo() {
    if (currentVideoIndex < videoUrls.length - 1) {
      currentVideoIndex++;
      loadVideo(currentVideoIndex, Duration.zero);
    } else {
      isPlay = false;
      videoPlayerController!.pause();
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  Future<void> initAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(
      AudioSessionConfiguration(
        avAudioSessionCategory: AVAudioSessionCategory.playback,
        avAudioSessionCategoryOptions:
            AVAudioSessionCategoryOptions.mixWithOthers,
        avAudioSessionMode: AVAudioSessionMode.defaultMode,
        androidAudioAttributes: AndroidAudioAttributes(
          contentType: AndroidAudioContentType.music,
          usage: AndroidAudioUsage.media,
          flags: AndroidAudioFlags.none,
        ),
        androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    audioPlayer.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final categoryList = AppDataBase.categoryList;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppWidgetColor.bgColor,
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return verticalVideoPlayer(
                  size, categoryList, context, orientation);
            } else {
              return horizontalVideoPlayer(size, orientation);
            }
          },
        ),
      ),
    );
  }

  Widget horizontalVideoPlayer(Size size, Orientation orientation) {
    return GestureDetector(
      onTap: () => onClicked(),
      child: Stack(
        children: [
          videoPlayerController != null &&
                  videoPlayerController!.value.isInitialized
              ? SizedBox(
                  child: VideoPlayer(videoPlayerController!),
                )
              : Container(
                  color: AppWidgetColor.bgColor,
                ),
          initialPlay || showIcon
              ? AppBarVideoPlayer(size: size, orientation: orientation)
              : SizedBox(),
          showIcon
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 15.0,
                        sigmaY: 15.0,
                      ),
                      child: Container(
                        constraints: BoxConstraints(
                          maxHeight: size.height * 0.37,
                        ),
                        decoration: BoxDecoration(
                          color:
                              AppWidgetColor.backgroundSliderVideoPlayerColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: size.height * 0.03,
                                right: size.width * 0.04,
                                left: size.width * 0.04,
                              ),
                              child: !initialPlay && firstPlay
                                  ? Column(
                                      spacing: size.height * 0.01,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                formatDuration(
                                                    totalElapsedTime),
                                                style: AppTextStyle
                                                    .timerVideoPlayer),
                                            Text(formatDuration(totalDuration),
                                                style: AppTextStyle
                                                    .timerVideoPlayer),
                                          ],
                                        ),
                                        SliderTheme(
                                          data: SliderThemeData(
                                            activeTrackColor:
                                                AppWidgetColor.activeTrackColor,
                                            inactiveTickMarkColor:
                                                AppWidgetColor
                                                    .inactiveTrackColor,
                                            thumbShape: GlowingSliderThumb(
                                                thumbRadius: 10),
                                            overlayShape:
                                                RoundSliderOverlayShape(
                                                    overlayRadius: 0),
                                          ),
                                          child: Slider(
                                            activeColor: Colors.white,
                                            max: totalDuration.inMilliseconds
                                                .toDouble(),
                                            value: totalElapsedTime
                                                .inMilliseconds
                                                .toDouble(),
                                            onChanged: (value) {
                                              setState(
                                                () {
                                                  totalElapsedTime = Duration(
                                                      milliseconds:
                                                          value.toInt());
                                                },
                                              );
                                            },
                                            onChangeStart: (value) =>
                                                videoPlayerController!.pause(),
                                            onChangeEnd: (value) {
                                              seekToPosition(
                                                Duration(
                                                  milliseconds: value.toInt(),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.2,
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                right: size.width * 0.1),
                                            child: ListVideo(
                                              size: size,
                                              videoUrls: videoUrls,
                                              currentVideoIndex:
                                                  currentVideoIndex,
                                              videoPlayerController:
                                                  videoPlayerController,
                                              videoDurations: videoDurations,
                                              orientation: orientation,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : SizedBox(),
                            ),
                            Positioned(
                              right: size.width * 0.05,
                              bottom: size.width * 0.02,
                              child: GestureDetector(
                                onTap: () {
                                  onClicked();
                                  showFlexibleBottomSheet(
                                    bottomSheetColor: Colors.transparent,
                                    isSafeArea: true,
                                    minHeight: 0,
                                    initHeight: 0.8,
                                    maxHeight: 0.8,
                                    context: context,
                                    builder: buildBottomSheet,
                                    isExpand: false,
                                    bottomSheetBorderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(32),
                                      topRight: Radius.circular(32),
                                    ),
                                  );
                                },
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
                                              maxWidth: size.height * 0.16,
                                              maxHeight: size.height * 0.16,
                                            ),
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  Assets.img.png.heavyRain.path,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            child: Center(
                                              child: audioPlayer.playing
                                                  ? SvgPicture.asset(
                                                      Assets.img.svg.music,
                                                      height:
                                                          size.height * 0.08,
                                                    )
                                                  : CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                            ),
                                          ),
                                          CircularPercentIndicator(
                                            reverse: true,
                                            radius: size.height * 0.08,
                                            lineWidth: 2.5,
                                            percent: (audioPlayer.duration !=
                                                        null &&
                                                    audioPlayer.duration!
                                                            .inMilliseconds >
                                                        0)
                                                ? audioPlayer.position
                                                            .inMilliseconds <
                                                        audioPlayer.duration!
                                                            .inMilliseconds
                                                    ? audioPlayer.position
                                                            .inMilliseconds /
                                                        audioPlayer.duration!
                                                            .inMilliseconds
                                                    : 0.0
                                                : 0.0,
                                            progressColor: Colors.white,
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
          initialPlay || showIcon
              ? Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        spacing: size.width * 0.1,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          firstPlay
                              ? GestureDetector(
                                  onTap: () {
                                    seekBackward();
                                  },
                                  child: Arrow30MinBottom(
                                    image: Assets.img.png.arrowleft30min.path,
                                    size: size,
                                    orientation: orientation,
                                  ),
                                )
                              : SizedBox(),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  if (videoPlayerController!.value.isPlaying) {
                                    isPlay = false;
                                    videoPlayerController!.pause();
                                  } else {
                                    isPlay = true;
                                    firstPlay = true;
                                    initialPlay = false;
                                    videoPlayerController!.play();
                                  }
                                },
                              );
                            },
                            child: videoPlayerController != null &&
                                    videoPlayerController!.value.isInitialized
                                ? PlayBottom(
                                    videoPlayerController:
                                        videoPlayerController,
                                    size: size,
                                    orientation: orientation,
                                  )
                                : LoadingVideo(size: size),
                          ),
                          firstPlay
                              ? GestureDetector(
                                  onTap: () {
                                    seekForward();
                                  },
                                  child: Arrow30MinBottom(
                                    size: size,
                                    image: Assets.img.png.arrowright30min.path,
                                    orientation: orientation,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget verticalVideoPlayer(Size size, List<CategoryList> categoryList,
      BuildContext context, Orientation orientation) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => onClicked(),
              child: Stack(
                children: [
                  videoPlayerController != null &&
                          videoPlayerController!.value.isInitialized
                      ? Container(
                          constraints: BoxConstraints(
                            maxHeight: size.height * 0.52,
                          ),
                          child: OverflowBox(
                            maxWidth: size.width * 2,
                            maxHeight: size.height * 0.52,
                            child: VideoPlayer(videoPlayerController!),
                          ),
                        )
                      : Container(
                          constraints: BoxConstraints(
                            maxHeight: size.height * 0.52,
                          ),
                          color: AppWidgetColor.bgColor,
                        ),
                  initialPlay || showIcon
                      ? AppBarVideoPlayer(
                          size: size,
                          orientation: orientation,
                        )
                      : SizedBox(),
                  LinearGradeiantUnderSlider(size: size),
                  showIcon
                      ? Positioned(
                          left: 0,
                          right: 0,
                          bottom: size.height * 0.02,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: size.width * 0.04,
                              left: size.width * 0.04,
                            ),
                            child: !initialPlay && firstPlay
                                ? Column(
                                    spacing: size.height * 0.01,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(formatDuration(totalElapsedTime),
                                              style: AppTextStyle
                                                  .timerVideoPlayer),
                                          Text(formatDuration(totalDuration),
                                              style: AppTextStyle
                                                  .timerVideoPlayer),
                                        ],
                                      ),
                                      SliderTheme(
                                          data: SliderThemeData(
                                            activeTrackColor:
                                                AppWidgetColor.activeTrackColor,
                                            inactiveTickMarkColor:
                                                AppWidgetColor
                                                    .inactiveTrackColor,
                                            thumbShape: GlowingSliderThumb(
                                                thumbRadius: 10),
                                            overlayShape:
                                                RoundSliderOverlayShape(
                                                    overlayRadius: 0),
                                          ),
                                          child: Slider(
                                            activeColor: Colors.white,
                                            max: totalDuration.inMilliseconds
                                                .toDouble(),
                                            value: totalElapsedTime
                                                .inMilliseconds
                                                .toDouble(),
                                            onChanged: (value) {
                                              setState(() {
                                                totalElapsedTime = Duration(
                                                    milliseconds:
                                                        value.toInt());
                                              });
                                            },
                                            onChangeStart: (value) =>
                                                videoPlayerController!.pause(),
                                            onChangeEnd: (value) {
                                              seekToPosition(
                                                Duration(
                                                  milliseconds: value.toInt(),
                                                ),
                                              );
                                            },
                                          )),
                                    ],
                                  )
                                : SizedBox(),
                          ),
                        )
                      : SizedBox(),
                  initialPlay || showIcon
                      ? Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                spacing: size.width * 0.1,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  firstPlay
                                      ? GestureDetector(
                                          onTap: () {
                                            seekBackward();
                                          },
                                          child: Arrow30MinBottom(
                                            image: Assets
                                                .img.png.arrowleft30min.path,
                                            size: size,
                                            orientation: orientation,
                                          ),
                                        )
                                      : SizedBox(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(
                                        () {
                                          if (videoPlayerController!
                                              .value.isPlaying) {
                                            isPlay = false;
                                            videoPlayerController!.pause();
                                          } else {
                                            isPlay = true;
                                            firstPlay = true;
                                            initialPlay = false;
                                            videoPlayerController!.play();
                                          }
                                        },
                                      );
                                    },
                                    child: videoPlayerController != null &&
                                            videoPlayerController!
                                                .value.isInitialized
                                        ? PlayBottom(
                                            videoPlayerController:
                                                videoPlayerController,
                                            size: size,
                                            orientation: orientation,
                                          )
                                        : LoadingVideo(size: size),
                                  ),
                                  firstPlay
                                      ? GestureDetector(
                                          onTap: () {
                                            seekForward();
                                          },
                                          child: Arrow30MinBottom(
                                            size: size,
                                            image: Assets
                                                .img.png.arrowright30min.path,
                                            orientation: orientation,
                                          ),
                                        )
                                      : SizedBox(),
                                ],
                              ),
                            ],
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ListVideo(
                    size: size,
                    videoUrls: videoUrls,
                    currentVideoIndex: currentVideoIndex,
                    videoPlayerController: videoPlayerController,
                    videoDurations: videoDurations,
                    orientation: orientation,
                  ),
                  SizedBox(
                    height: size.height * 0.3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          TitleVideoPlayer(size: size),
                          CategoryListWidget(
                              size: size, categoryList: categoryList),
                          DescriptionVideoPlayer(size: size),
                          SizedBox(
                            height: size.height * 0.06,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          right: size.width * 0.04,
          bottom: size.width * 0.08,
          child: GestureDetector(
            onTap: () => verticalBottomSheet(context, size),
            child: MusicPlayerBottom(
              audioPlayer: audioPlayer,
              size: size,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> verticalBottomSheet(BuildContext context, Size size) {
    return showModalBottomSheet(
      backgroundColor: AppWidgetColor.bottomSheetVideoPlayerColor,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) => ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(27),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: size.height * 0.55,
                ),
                child: Column(
                  spacing: size.height * 0.03,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.035,
                            right: size.width * 0.08,
                            left: size.width * 0.08,
                          ),
                          child: Column(
                            spacing: size.height * 0.015,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  AppString.videoAudio,
                                  style:
                                      AppTextStyle.titleBottomSheetVideoPlayer,
                                  minFontSize: 8,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                spacing: size.width * 0.03,
                                children: [
                                  SvgPicture.asset(
                                    Assets.img.svg.volumeMute,
                                  ),
                                  Expanded(
                                    child: SliderTheme(
                                      data: SliderThemeData(
                                        overlayShape:
                                            SliderComponentShape.noOverlay,
                                        trackHeight: 4,
                                        activeTrackColor:
                                            AppWidgetColor.activeTrackColor,
                                        inactiveTickMarkColor:
                                            AppWidgetColor.inactiveTrackColor,
                                        thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 7,
                                        ),
                                      ),
                                      child: Slider(
                                        activeColor: Colors.white,
                                        value: videoPlayerController != null &&
                                                videoPlayerController!
                                                    .value.isInitialized
                                            ? videoVolume
                                            : volume,
                                        min: 0.0,
                                        max: 1.0,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              changeVolumeVideo(value);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(Assets.img.svg.volumeHigh)
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * 0.035,
                            right: size.width * 0.08,
                            left: size.width * 0.08,
                          ),
                          child: Column(
                            spacing: size.height * 0.015,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AutoSizeText(
                                  AppString.musicAudio,
                                  style:
                                      AppTextStyle.titleBottomSheetVideoPlayer,
                                  minFontSize: 8,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Row(
                                spacing: size.width * 0.03,
                                children: [
                                  SvgPicture.asset(
                                    Assets.img.svg.volumeMute,
                                  ),
                                  Expanded(
                                    child: SliderTheme(
                                      data: SliderThemeData(
                                        overlayShape:
                                            SliderComponentShape.noOverlay,
                                        trackHeight: 4,
                                        activeTrackColor:
                                            AppWidgetColor.activeTrackColor,
                                        inactiveTickMarkColor:
                                            AppWidgetColor.inactiveTrackColor,
                                        thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 7,
                                        ),
                                      ),
                                      child: Slider(
                                        activeColor: Colors.white,
                                        value: audioPlayer.playing
                                            ? musicVolume
                                            : volume,
                                        min: 0.0,
                                        max: 1.0,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              changeVolumeMusic(
                                                value,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset(Assets.img.svg.volumeHigh)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: size.width * 0.08,
                        right: size.width * 0.08,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: size.height * 0.08,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: size.width * 0.04,
                          left: size.width * 0.04,
                        ),
                        child: Row(
                          spacing: size.width * 0.02,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.width * 0.115,
                                maxWidth: size.width * 0.115,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Assets.img.png.heavyRain.path,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              spacing: size.height * 0.005,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: size.width * 0.3,
                                    maxHeight: size.height * 0.03,
                                  ),
                                  child: AutoSizeText(
                                    'Stress Relief ',
                                    style: AppTextStyle
                                        .titleMusicinPlayerBottomSheetVideoPlayer,
                                    minFontSize: 7,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: size.width * 0.3,
                                    maxHeight: size.height * 0.03,
                                  ),
                                  child: AutoSizeText(
                                    'Muse Simd',
                                    style: AppTextStyle
                                        .artistMusicinPlayerBottomSheetVideoPlayer,
                                    minFontSize: 5,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: size.width * 0.08,
                        left: size.width * 0.08,
                      ),
                      child: Column(
                        spacing: size.height * 0.01,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              AppString.musicAudio,
                              style: AppTextStyle.titleBottomSheetVideoPlayer,
                              minFontSize: 8,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.135,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: size.width * 0.08,
                            ),
                            constraints: BoxConstraints(
                              maxHeight: size.height * 0.115,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                      right: size.width * 0.03,
                                      bottom: size.height * 0.01),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: size.height * 0.005,
                                      right: size.width * 0.02,
                                      left: size.width * 0.02,
                                      bottom: size.height * 0.005,
                                    ),
                                    child: Row(
                                      spacing: size.width * 0.01,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          'Pop',
                                          style: AppTextStyle
                                              .titleCategoryMusicPlayerBottomSheetVideoPlayer,
                                          minFontSize: 7,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        AutoSizeText(
                                          'Stress Relief',
                                          style: AppTextStyle
                                              .artistCategoryMusicPlayerBottomSheetVideoPlayer,
                                          maxLines: 1,
                                          minFontSize: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: size.width * 0.03,
                                      bottom: size.height * 0.01),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: size.height * 0.005,
                                      right: size.width * 0.02,
                                      left: size.width * 0.02,
                                      bottom: size.height * 0.005,
                                    ),
                                    child: Row(
                                      spacing: size.width * 0.01,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          'kendrick lamar',
                                          style: AppTextStyle
                                              .titleCategoryMusicPlayerBottomSheetVideoPlayer,
                                          minFontSize: 7,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        AutoSizeText(
                                          'Not Like Us',
                                          style: AppTextStyle
                                              .artistCategoryMusicPlayerBottomSheetVideoPlayer,
                                          maxLines: 1,
                                          minFontSize: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    final size = MediaQuery.sizeOf(context);

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 20,
        sigmaY: 20,
      ),
      child: StatefulBuilder(
        builder: (context, setState) => Container(
          constraints: BoxConstraints(
            maxHeight: size.height * 0.6,
          ),
          child: Row(
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.5,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.width * 0.035,
                        right: size.height * 0.08,
                        left: size.height * 0.08,
                      ),
                      child: Column(
                        spacing: size.width * 0.015,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              AppString.videoAudio,
                              style: AppTextStyle.titleBottomSheetVideoPlayer,
                              minFontSize: 8,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            spacing: size.height * 0.03,
                            children: [
                              SvgPicture.asset(
                                Assets.img.svg.volumeMute,
                              ),
                              Expanded(
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    overlayShape:
                                        SliderComponentShape.noOverlay,
                                    trackHeight: 4,
                                    activeTrackColor:
                                        AppWidgetColor.activeTrackColor,
                                    inactiveTickMarkColor:
                                        AppWidgetColor.inactiveTrackColor,
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 7,
                                    ),
                                  ),
                                  child: Slider(
                                    activeColor: Colors.white,
                                    value: videoPlayerController != null &&
                                            videoPlayerController!
                                                .value.isInitialized
                                        ? videoVolume
                                        : volume,
                                    min: 0.0,
                                    max: 1.0,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          changeVolumeVideo(value);
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SvgPicture.asset(Assets.img.svg.volumeHigh)
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.width * 0.035,
                        right: size.height * 0.08,
                        left: size.height * 0.08,
                      ),
                      child: Column(
                        spacing: size.width * 0.015,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              AppString.musicAudio,
                              style: AppTextStyle.titleBottomSheetVideoPlayer,
                              minFontSize: 8,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            spacing: size.height * 0.03,
                            children: [
                              SvgPicture.asset(
                                Assets.img.svg.volumeMute,
                              ),
                              Expanded(
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    overlayShape:
                                        SliderComponentShape.noOverlay,
                                    trackHeight: 4,
                                    activeTrackColor:
                                        AppWidgetColor.activeTrackColor,
                                    inactiveTickMarkColor:
                                        AppWidgetColor.inactiveTrackColor,
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 7,
                                    ),
                                  ),
                                  child: Slider(
                                    activeColor: Colors.white,
                                    value: audioPlayer.playing
                                        ? musicVolume
                                        : volume,
                                    min: 0.0,
                                    max: 1.0,
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          changeVolumeMusic(
                                            value,
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SvgPicture.asset(Assets.img.svg.volumeHigh)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.5,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: size.height * 0.08,
                        left: size.height * 0.08,
                        right: size.height * 0.08,
                      ),
                      constraints: BoxConstraints(
                        maxHeight: size.width * 0.08,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: size.height * 0.04,
                          left: size.height * 0.04,
                        ),
                        child: Row(
                          spacing: size.height * 0.02,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxHeight: size.height * 0.115,
                                maxWidth: size.height * 0.115,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Assets.img.png.heavyRain.path,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              spacing: size.width * 0.005,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: size.height * 0.3,
                                    maxHeight: size.width * 0.03,
                                  ),
                                  child: AutoSizeText(
                                    'Stress Relief ',
                                    style: AppTextStyle
                                        .titleMusicinPlayerBottomSheetVideoPlayer,
                                    minFontSize: 7,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  constraints: BoxConstraints(
                                    maxWidth: size.height * 0.3,
                                    maxHeight: size.width * 0.03,
                                  ),
                                  child: AutoSizeText(
                                    'Muse Simd',
                                    style: AppTextStyle
                                        .artistMusicinPlayerBottomSheetVideoPlayer,
                                    minFontSize: 5,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          right: size.height * 0.08,
                          left: size.height * 0.08,
                          bottom: size.height * 0.03),
                      child: Column(
                        spacing: size.width * 0.01,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              AppString.musicAudioList,
                              style: AppTextStyle.titleBottomSheetVideoPlayer,
                              minFontSize: 8,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.10,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: index == 0
                                  ? size.height * 0.08
                                  : size.height * 0.02,
                            ),
                            constraints: BoxConstraints(
                              minWidth: size.height * 0.2,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: size.height * 0.08,
                                  margin: EdgeInsets.only(
                                    bottom: size.height * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: size.height * 0.005,
                                      right: size.width * 0.02,
                                      left: size.width * 0.02,
                                      bottom: size.height * 0.005,
                                    ),
                                    child: Row(
                                      spacing: size.height * 0.02,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          index % 2 == 0 ? 'HipHop' : 'Pop',
                                          style: AppTextStyle
                                              .titleCategoryMusicPlayerBottomSheetVideoPlayer,
                                          minFontSize: 7,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        AutoSizeText(
                                          'Stress Relief',
                                          style: AppTextStyle
                                              .artistCategoryMusicPlayerBottomSheetVideoPlayer,
                                          maxLines: 1,
                                          minFontSize: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: size.height * 0.1,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                              left: index == 0
                                  ? size.height * 0.08
                                  : size.height * 0.02,
                            ),
                            constraints: BoxConstraints(
                              minWidth: size.height * 0.2,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: size.height * 0.08,
                                  margin: EdgeInsets.only(
                                    bottom: size.height * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: size.height * 0.005,
                                      right: size.width * 0.02,
                                      left: size.width * 0.02,
                                      bottom: size.height * 0.005,
                                    ),
                                    child: Row(
                                      spacing: size.height * 0.02,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AutoSizeText(
                                          index % 2 == 0 ? 'HipHop' : 'Pop',
                                          style: AppTextStyle
                                              .titleCategoryMusicPlayerBottomSheetVideoPlayer,
                                          minFontSize: 7,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        AutoSizeText(
                                          'Stress Relief',
                                          style: AppTextStyle
                                              .artistCategoryMusicPlayerBottomSheetVideoPlayer,
                                          maxLines: 1,
                                          minFontSize: 5,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
