
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' show Obx;
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/exercise/controllers/exercise_controllers.dart';
import 'package:skyyoga/screens/exercise/models/past_exercise_models.dart';
import 'package:skyyoga/utils/device_utility.dart';

class PastExerciseWidget extends StatelessWidget {
  final PastExerciseModel pastExerciseModel;
  final ExerciseScreenController controller;

  const PastExerciseWidget({super.key, required this.pastExerciseModel, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              // color: Colors.orange,
              height: AppDeviceUtils.getScreenheight()*0.09,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                          height: AppDeviceUtils.getScreenheight()*0.08,
                          fit: BoxFit.fill, imageUrl: pastExerciseModel.thumbnail),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  Expanded(
                    flex: 7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  '#${pastExerciseModel.id}',
                                  style: AppTextStyle.exerciseScreenDescriptionStyle,
                                ),
                                SizedBox(
                                  // color: Colors.orange,
                                  height:AppDeviceUtils.getScreenheight()*0.03,
                                  child:
                                AutoSizeText(
                                    pastExerciseModel.title,
                                    style: AppTextStyle.pastExerciseWidgetTitleStyle
                                ),),
                                SizedBox(
                                  // color: Colors.orange,
                                  height:AppDeviceUtils.getScreenheight()*0.02,
                                  child: AutoSizeText(
                                      minFontSize: 7,
                                      '${pastExerciseModel.duration.toString()} min',
                                      style: AppTextStyle.pastExerciseWidgetTitleStyle
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Obx(() {
                      return  GestureDetector(
                        onTap: (){

                          pastExerciseModel.isLiked.value=!pastExerciseModel.isLiked.value;
                      if(   pastExerciseModel.isLiked.value==true){
                        controller.addIdToList(pastExerciseModel.id);
                      }else{
                        controller.removeIdFromList(pastExerciseModel.id);
                      }

                        },
                        child: SvgPicture.asset(

                            !pastExerciseModel.isLiked.value?'assets/img/svg/star.svg':'assets/img/svg/star-1.svg',
                          height:30 ,
                          width: 30,
                          ),

                      );

                      // child: Icon(
                      //       !pastExerciseModel.isLiked.value
                      //           ? Iconsax.star4
                      //           : Iconsax.star1,
                      //       size: 28,),
                      // );



                    }),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Text(pastExerciseModel.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.pastExerciseWidgetDescriptionStyle),
            SizedBox(height: 8.0),
            LinearProgressIndicator(
              value:
              pastExerciseModel.watchedNumber / pastExerciseModel.sequenceLength,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 8.0),
            Text(
              '${pastExerciseModel.watchedNumber
                  .toString()}/${pastExerciseModel.sequenceLength
                  .toString()} Classes complete',
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
