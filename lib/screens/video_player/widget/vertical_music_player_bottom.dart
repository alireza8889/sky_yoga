import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:skyyoga/gen/assets.gen.dart';

class MusicPlayerBottom extends StatelessWidget {
  const MusicPlayerBottom({
    super.key,
    required this.audioPlayer,
    required this.size,
  });

  final AudioPlayer audioPlayer;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      Assets.img.png.heavyRain.path,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: audioPlayer.playing
                      ? SvgPicture.asset(
                          Assets.img.svg.music,
                          height: size.width * 0.08,
                        )
                      : CircularProgressIndicator(
                          color: Colors.white,
                        ),
                ),
              ),
              CircularPercentIndicator(
                reverse: true,
                radius: size.width * 0.08,
                lineWidth: 2.5,
                percent: (audioPlayer.duration != null &&
                        audioPlayer.duration!.inMilliseconds > 0)
                    ? audioPlayer.position.inMilliseconds <
                            audioPlayer.duration!.inMilliseconds
                        ? audioPlayer.position.inMilliseconds /
                            audioPlayer.duration!.inMilliseconds
                        : 0.0
                    : 0.0,
                progressColor: Colors.white,
                backgroundColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
