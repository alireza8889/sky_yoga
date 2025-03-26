import 'package:flutter/material.dart';
import 'package:skyyoga/screens/progress/screens/widgets/goal_level_thumbnail_widget.dart';
import 'package:skyyoga/utils/device_utility.dart';

import '../../models/goal_level_thumbnail_model.dart';

class GoalsLevelsWidget extends StatelessWidget {
  final String goalName;
  final List<GoalLevelThumbNailModel> goalLevelsThumbnail;

  const GoalsLevelsWidget(
      {super.key, required this.goalName, required this.goalLevelsThumbnail});

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      height: 120,
      width: AppDeviceUtils.getScreenWidth(),
      // color: Colors.purple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            goalName,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          SizedBox(
            // color: Colors.purple,

          height: 100,
            width: AppDeviceUtils.getScreenWidth(),
            child: ListView.builder(
              physics: goalLevelsThumbnail.length<=4?NeverScrollableScrollPhysics():null,
              scrollDirection: Axis.horizontal,
              itemCount: goalLevelsThumbnail.length,
              itemBuilder: (context, index) {
                final thumbnailItem = goalLevelsThumbnail[index];
                return Row(
                  children: [
                    GoalLevelThumbnailWidget(
                        imageUrl: thumbnailItem.imageUrl,
                        levelStatus: thumbnailItem.levelStatus,
                        levelNumber: thumbnailItem.levelNumber),
                    SizedBox(width:AppDeviceUtils.getScreenWidth()*0.05 ,)
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
