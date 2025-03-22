import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';

class BottonProfileHorizontal extends StatelessWidget {
  const BottonProfileHorizontal({
    super.key,
    required this.size,
    required this.text1,
    required this.text2,
    required this.icon1,
    required this.icon2,
  });

  final Size size;
  final String text1;
  final String text2;
  final Widget icon1;
  final Widget icon2;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.07,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppWidgetColor.borderColor,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.04,
            left: size.width * 0.04,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                spacing: size.width * 0.02,
                children: [
                  icon1,
                  Text(
                    text1,
                    style: AppTextStyle.titleProfileBottonVerticlaTextStyle
                        .apply(fontSizeFactor: 1.05),
                  ),
                ],
              ),
              Row(
                spacing: size.width * 0.04,
                children: [
                  Text(
                    text2,
                    style: AppTextStyle.titleProfileBottonHorizontalTextStyle
                        .apply(fontSizeFactor: 1.05),
                  ),
                  icon2,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleBottonProfileVertical extends StatelessWidget {
  const TitleBottonProfileVertical({
    super.key,
    required this.size,
    required this.text,
    required this.svgPic,
  });

  final Size size;
  final String text;
  final Widget svgPic;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.28,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppWidgetColor.borderColor,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.02,
          left: size.width * 0.04,
          bottom: size.height * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [svgPic],
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.23,
                  child: AutoSizeText(
                    text,
                    style: AppTextStyle.titleProfileBottonVerticlaTextStyle,
                    minFontSize: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
