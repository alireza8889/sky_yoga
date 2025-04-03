import 'dart:ui'; // برای استفاده از ImageFilter

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/utils/device_utility.dart';

class SuggestedExerciseWidgetItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String props;
  final String duration;


  const SuggestedExerciseWidgetItem(
      {super.key,
        required this.title,
        required this.description,
        required this.imageUrl, required this.props, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // حذف پس‌زمینه اصلی
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          // پس‌زمینه blur
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0), // تنظیم شدت blur
                child: Container(
                  color: Colors.black.withOpacity(0.05), // رنگ پس‌زمینه blur
                ),
              ),
            ),
          ),
          // محتوای ویجت
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:AppDeviceUtils.getScreenWidth()*0.03, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal:AppDeviceUtils.getScreenWidth()*0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: AutoSizeText(title,
                              textAlign: TextAlign.start,
                              minFontSize: 12,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:
                              AppTextStyle.suggestedExerciseItemTilteStyle),
                        ),
                        Expanded(
                          flex: 3,
                          child: AutoSizeText(
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 12,
                            maxLines: 3,
                            '$duration min $props\n$description',
                            style: AppTextStyle.suggestedExerciseScreenDescriptionStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
            flex: 2,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppWidgetColor.exerciseScreenGetStartButton,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: AutoSizeText(
                            maxLines: 1,
                            minFontSize: 12,
                            AppString.getStartButton,
                            style: AppTextStyle.getStartButton,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}