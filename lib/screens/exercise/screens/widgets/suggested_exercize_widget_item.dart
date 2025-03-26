import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_strings.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';

class SuggestedExerciseWidgetItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const SuggestedExerciseWidgetItem(
      {super.key,
      required this.title,
      required this.description,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return // Inside the Column's children:
        Container(
          // width: 200,
          child: Stack(children: [
                Positioned.fill(
          // Cover the container with the blur
          child: ClipRRect(
            // Clip to the container's rounded corners
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 15.0, sigmaY: 15.0), // Adjust blur intensity
              child: Container(
                color: Colors.white.withOpacity(0.1), // Necessary for blur to show
              ),
            ),
          ),
                ),
                Container(

          decoration: BoxDecoration(

              color: Colors.transparent, borderRadius: BorderRadius.circular(15))
          ,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            minFontSize: 10,

                            maxLines: 3,
                            description, // Add your description
                            style: AppTextStyle.exerciseScreenDescriptionStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppWidgetColor.exerciseScreenGetStartButton,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            AppTexts.getStartButton,
                            style:
                                TextStyle(color: AppTextColor.getStartButtonText),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
                ),
              ]),
        );
  }
}
