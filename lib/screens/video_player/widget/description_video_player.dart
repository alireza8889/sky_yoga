import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';

class DescriptionVideoPlayer extends StatelessWidget {
  const DescriptionVideoPlayer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size.width * 0.03,
        right: size.width * 0.04,
        left: size.width * 0.04,
      ),
      constraints: BoxConstraints(
        maxHeight: size.width * 0.25,
      ),
      child: AutoSizeText(
        'Korem ipsum dolor sit amet, consectetur adipiscing elitKorem ipsum dolor sit amet, Korem ipsum dolor sit amet, consectetur adipiscing elitKorem ipsum dolor sit amet,',
        style: AppTextStyle.descriptionVideoPlayer,
        textAlign: TextAlign.start,
        maxLines: 4,
        minFontSize: 8,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
