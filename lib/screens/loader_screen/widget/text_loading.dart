import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';

class TextLoading extends StatelessWidget {
  const TextLoading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: size.width * 0.09,
              maxWidth: size.width * 0.4,
            ),
            child: AutoSizeText(
              'Please Wait...',
              textAlign: TextAlign.center,
              style: AppTextStyle.titleLoadingVideo,
              minFontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
