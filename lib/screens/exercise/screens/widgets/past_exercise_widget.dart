import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/exercise/models/past_exercise_models.dart';

class PastExerciseWidget extends StatelessWidget {
  final PastExerciseModel pastExerciseModel;
  const PastExerciseWidget({super.key, required this.pastExerciseModel});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey)
      ),
   
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Padding inside the card
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align content to the left
          children: <Widget>[
            // Top Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Image
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: pastExerciseModel.imageUrl),
                  ),
                ),
                SizedBox(width: 16.0), // Spacing between image and text
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Number and Star
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '#${pastExerciseModel.number}',
                            style:AppTextStyle.exerciseScreenDescriptionStyle,
                          ),

                          Icon(!pastExerciseModel.isLiked
                              ? Icons.star_border
                              : Icons.star,size: 30,), // Star icon
                        ],
                      ),
                      // Title and Duration
                      Text(
                        pastExerciseModel.title,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${pastExerciseModel.time.toString()} min',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.0), // Spacing between sections

            // Middle Section
            Text(
              pastExerciseModel.description,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:AppTextStyle.pastExerciseScreenDescriptionStyle
            ),
            SizedBox(height: 5.0), // Spacing between sections

            // Bottom Section
            LinearProgressIndicator(
              value: pastExerciseModel.completedClass /
                  pastExerciseModel
                      .allClass, // Replace with your progress value (0.0 to 1.0)
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue), // Customize progress color
            ),
            SizedBox(height: 8.0), // Spacing between progress bar and text
            Text(
              '${pastExerciseModel.completedClass.toString()}/${pastExerciseModel.allClass.toString()} Classes complete',
              style: TextStyle(
                fontSize: 14.0,
                color: AppTextColor.exerciseScreenDescription,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
