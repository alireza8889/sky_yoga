import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/progress/models/goal_level_thumbnail_model.dart';
import 'package:skyyoga/screens/progress/models/goal_levels_model.dart';
import 'package:skyyoga/screens/progress/screens/widgets/select_goals_gridview_item.dart';
import 'package:skyyoga/utils/device_utility.dart';

import '../models/select_goals_item_model.dart';

class ProgressScreenController extends GetxController {
  List<GoalLevelsModel> goalLevelsList = [
    GoalLevelsModel(label: 'Chill', goalLevels: [
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.passed.toString(),
          levelNumber: 1),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.passed.toString(),
          levelNumber: 2),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.inProcess.toString(),
          levelNumber: 3),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.locked.toString(),
          levelNumber: 4),
    ]),
    GoalLevelsModel(label: 'Moderate', goalLevels: [
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.passed.toString(),
          levelNumber: 1),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.passed.toString(),
          levelNumber: 2),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.inProcess.toString(),
          levelNumber: 3),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.locked.toString(),
          levelNumber: 4),
    ]),
    GoalLevelsModel(label: 'Challenging', goalLevels: [
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.passed.toString(),
          levelNumber: 1),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.passed.toString(),
          levelNumber: 2),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.inProcess.toString(),
          levelNumber: 3),
      GoalLevelThumbNailModel(
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmjw8vWDsivJ0XOpq3JWe8nfyPJsJL-l0kJw&s',
          levelStatus: GoalLevelStatus.locked.toString(),
          levelNumber: 4),
    ]),
  ];

  RxList<GDPData> chartData = <GDPData>[].obs;

  RxList<SelectGoalsItemModel> allSelectingGoals = <SelectGoalsItemModel>[
    SelectGoalsItemModel(
      isSelected: false.obs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKPPAx7KDHx5wdgMsOvjoT0jIR8chuYiKz7w&s',
      name: 'نام goal1',
    ),
    SelectGoalsItemModel(
      isSelected: false.obs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKPPAx7KDHx5wdgMsOvjoT0jIR8chuYiKz7w&s',
      name: 'نام goal2',
    ),
    SelectGoalsItemModel(
      isSelected: false.obs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKPPAx7KDHx5wdgMsOvjoT0jIR8chuYiKz7w&s',
      name: 'نام goal3',
    ),
    SelectGoalsItemModel(
      isSelected: false.obs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKPPAx7KDHx5wdgMsOvjoT0jIR8chuYiKz7w&s',
      name: 'نام goal4',
    ),
    SelectGoalsItemModel(
      isSelected: false.obs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKPPAx7KDHx5wdgMsOvjoT0jIR8chuYiKz7w&s',
      name: 'نام goal5',
    ),
    SelectGoalsItemModel(
      isSelected: false.obs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKPPAx7KDHx5wdgMsOvjoT0jIR8chuYiKz7w&s',
      name: 'نام goal6',
    ),
    SelectGoalsItemModel(
      isSelected: false.obs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKPPAx7KDHx5wdgMsOvjoT0jIR8chuYiKz7w&s',
      name: 'نام goal7',
    ),
    SelectGoalsItemModel(
      isSelected: false.obs,
      imageUrl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKPPAx7KDHx5wdgMsOvjoT0jIR8chuYiKz7w&s',
      name: 'نام goal8',
    ),
  ].obs;
  //get chart data from api
  List<GDPData> getChartData() {
    chartData.value = [
      GDPData('Balance', 4, Colors.black),
      GDPData('Endurance', 9, Colors.purple),
      GDPData('Relaxation', 8, Colors.blue),
      GDPData('Flexibility', 4, Colors.orange),
      GDPData('Consistency', 6, Colors.green),
      GDPData('Strength', 8, Colors.red),
    ];

    return chartData;
  }

  void selectGoals(String goalName) {
    final items = allSelectingGoals.where((item) => item.name == goalName);
    for (var item in items) {
      item.isSelected.value = true;
    }
  }

  void unSelectGoals(String goalName) {
    final items = allSelectingGoals.where((item) => item.name == goalName);
    for (var item in items) {
      item.isSelected.value = false;
    }
  }

  void showSelectGoalsBottomSheet() {
    Get.bottomSheet(
      FractionallySizedBox(
        heightFactor: 0.95, // 70% of the screen height
        child: SingleChildScrollView(
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
            child: Container(
              height: AppDeviceUtils.getScreenheight(),
              color: Colors.black.withOpacity(0.8),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: AppDeviceUtils.getScreenheight() * 0.08,
                    width: double.infinity,
                    // color: Colors.blue,
                    child: AutoSizeText(
                      minFontSize: 12,
                      'What are the poses you`re eager to master?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: AppDeviceUtils.getScreenheight() * 0.05,
                    width: double.infinity,
                    // color: Colors.orange,
                    child: AutoSizeText(
                      minFontSize: 12,
                      'You can update this later in your journy?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  Container(
                    // color: Colors.pink,
                    height: AppDeviceUtils.getScreenheight() * 0.7,
                    child: GridView.builder(
                        physics: allSelectingGoals.length == 8
                            ? NeverScrollableScrollPhysics()
                            : null,
                        itemCount: allSelectingGoals.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent:
                                AppDeviceUtils.getScreenheight() * 0.14,
                            mainAxisSpacing:
                                AppDeviceUtils.getScreenheight() * 0.03,
                            crossAxisSpacing:
                                AppDeviceUtils.getScreenWidth() * 0.04),
                        itemBuilder: (context, index) {
                          final goalItem = allSelectingGoals[index];
                          return GestureDetector(
                            onTap: () {
                              //select and unselect goal items
                              if (goalItem.isSelected.value == false) {
                                selectGoals(goalItem.name);
                              } else {
                                unSelectGoals(goalItem.name);
                              }
                            },
                            child: SelectGoalsGridviewItem(
                              imageUrl: goalItem.imageUrl,
                              isSelected: goalItem.isSelected,
                            ),
                          );
                        }),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            // bottom: AppDeviceUtils.getScreenWidth() * 0.07,
                            left: 10,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            final activeButton = allSelectingGoals
                                .any((item) => item.isSelected.value == true);

                            if (activeButton == true) {
                              //set goals function
                            } else {
                              //do nothing
                            }
                          },
                          child: Obx(() {
                            final activeButton = allSelectingGoals
                                .any((item) => item.isSelected.value == true);
                            return Container(
                              decoration: BoxDecoration(
                                  color: activeButton
                                      ? AppWidgetColor
                                          .selectGoalsScreenActiveButton
                                      : AppWidgetColor
                                          .selectGoalsScreenNotActiveButton,
                                  borderRadius: BorderRadius.circular(15)),
                              height: 45,
                              child: Center(
                                  child: Text(
                                'Set goals',
                                style: TextStyle(color: Colors.white),
                              )),
                            );
                          }),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
    );
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getChartData();
    super.onInit();
  }
}

class GDPData {
  GDPData(this.label, this.gdp, this.color);

  final String label;
  final int gdp;
  final Color color;
}
