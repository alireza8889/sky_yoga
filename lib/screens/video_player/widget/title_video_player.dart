import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';

class TitleVideoPlayer extends StatelessWidget {
  const TitleVideoPlayer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size.width * 0.01,
        right: size.width * 0.04,
        left: size.width * 0.04,
      ),
      constraints: BoxConstraints(
        maxHeight: size.width * 0.2,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: AutoSizeText(
          'Deep strech for hips & hamstrings',
          textAlign: TextAlign.left,
          style: AppTextStyle.titleVideoPlayer,
          minFontSize: 15,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
