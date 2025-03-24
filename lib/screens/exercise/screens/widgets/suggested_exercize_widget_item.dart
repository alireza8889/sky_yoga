import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';

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
        Stack(children: [
          Positioned.fill( // Cover the container with the blur
            child: ClipRRect( // Clip to the container's rounded corners
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0), // Adjust blur intensity
                child: Container(
                  color: Colors.transparent, // Necessary for blur to show
                ),
              ),
            ),
          ),
      Container(
        decoration: BoxDecoration(
            color:Colors.transparent,
            borderRadius: BorderRadius.circular(15)),
        width: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                   
                    ),
                    child: CachedNetworkImage(
                      width: 180,
                      imageUrl: imageUrl,fit: BoxFit.fill,),
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

                        child: AutoSizeText(title,
                            textAlign: TextAlign.start,
                            minFontSize: 10,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.suggestedExerciseItemTilteStyle),
                        flex: 2,
                      ),
                      Expanded(
                        child: AutoSizeText(
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 10,

                          maxLines: 3,
                          description, // Add your description
                          style: AppTextStyle.exerciseScreenDescriptionStyle,
                        ),
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle "Get start" button press
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('Get start'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    ]);
  }
}
