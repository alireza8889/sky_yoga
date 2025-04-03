import 'package:auto_size_text/auto_size_text.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/controller/progress_controllers/progress_controller.dart';
import 'package:skyyoga/screens/progress/screens/widgets/chart_lable_widget.dart';
import 'package:skyyoga/screens/progress/screens/widgets/goals_levels_widget.dart';
import 'package:skyyoga/widget/loading_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../components/text_style.dart';
import '../../../utils/device_utility.dart';
import 'package:get/get.dart';

import '../controllers/progress_screen_controller.dart';
import '../models/gdp_model_for_chart.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final progressScreenController = Get.put(ProgressScreenController());
    // final bool showGoals = progressScreenController.goalLevelsList.isNotEmpty;
    final bool showDescription = progressScreenController.chartData.isEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: BackGroundColor(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: AppDeviceUtils.getScreenheight() * 0.02,
                left: AppDeviceUtils.getScreenWidth() * 0.05,
                right: AppDeviceUtils.getScreenWidth() * 0.05,
                bottom: AppDeviceUtils.getScreenheight() * 0.09,
              ),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //title and description
                      SizedBox(
                        // color: Colors.blue,
                        width: AppDeviceUtils.getScreenWidth(),
                        height: showDescription
                            ? AppDeviceUtils.getScreenheight() * 0.11
                            : AppDeviceUtils.getScreenheight() * 0.05,
                        // title and description
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: AppDeviceUtils.getScreenheight() * 0.05,
                              width: AppDeviceUtils.getScreenWidth(),
                              child: AutoSizeText(
                                AppString.progressScreenTitle,
                                minFontSize: 12,
                                style: AppTextStyle.progressScreenGoalsTitle,
                                maxLines: 1,
                              ),
                              // color: Colors.orangeAccent,
                            ),
                            // Container(color:Colors.orangeAccent,height: AppDeviceUtils.getScreenheight()*0.01,),
                            showDescription
                                ? SizedBox(
                              // color: Colors.red,
                              height:
                              AppDeviceUtils.getScreenheight() * 0.05,
                              child: AutoSizeText(
                                minFontSize: 12,
                                AppString.progressScreenDescription,
                                style: AppTextStyle
                                    .progressScreenDescriptionStyle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                                : SizedBox(),
                          ],
                        ),
                      ),
                      //space between
            
                      //chart
                      SizedBox(
                        height: AppDeviceUtils.getScreenheight() * 0.35,
                        // color: Colors.green,
                        child: Obx(() {
                          if (progressScreenController.getChartDataLoading
                              .value == true) {
                            return LoadingWidget(
                                height: AppDeviceUtils.getScreenheight() * 0.3,
                                width: AppDeviceUtils.getScreenheight() * 0.3);
                          }
                          return SfCircularChart(
            
                            palette: List.generate(
                                progressScreenController.chartData.length,
                                    (index) =>
                                progressScreenController
                                    .chartData[index].color),
                            series: <CircularSeries>[
                              RadialBarSeries<GDPData, String>(
            
                                trackBorderWidth: 1.01,
                                trackBorderColor: Colors.transparent,
                                radius: '90%',
                                innerRadius: '30%',
                                // ignore: invalid_use_of_protected_member
                                dataSource: progressScreenController.chartData,
                                xValueMapper: (GDPData data, _) => data.label,
                                yValueMapper: (GDPData data, _) => data.gdp,
                                maximumValue: 10,
            
                                cornerStyle: CornerStyle.bothCurve,
                                enableTooltip: true,
                              ),
                            ],
                          );
                        }),
                      ),
                      //chart Labels
                      Obx(() {
                        return Wrap(
                          children: List.generate(
                              progressScreenController.chartData.length, (
                              index) {
                            return ChartLabelWidget(
                                color: progressScreenController
                                    .chartData[index].color,
                                label: progressScreenController
                                    .chartData[index].label);
                          }),
                        );
                      }),
                      //goals title and description
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppDeviceUtils.getScreenheight() * 0.05,
                            width: AppDeviceUtils.getScreenWidth() * 0.58,
                            // color: Colors.pink,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                AppString.progressScreenGoalsTitle,
                                minFontSize: 12,
                                style: AppTextStyle.progressScreenGoalsTitle,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Obx(() {
                            if(progressScreenController.goalLevelsList.isEmpty)
                            {
                              return SizedBox();
                            }
                            return Container(
                              padding: EdgeInsets.only(top: 0, right: 5),
                              // color: Colors.orangeAccent,
            
                              height: AppDeviceUtils.getScreenheight() * 0.05,
                              width: AppDeviceUtils.getScreenWidth() * 0.32,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: TextButton(
                                  onPressed: () {
                                    progressScreenController
                                        .showSelectGoalsBottomSheet();
                                  },
                                  child: AutoSizeText(
                                      minFontSize: 8,
                                      style: TextStyle(fontSize: 15),
                                      'Edit Goal'),
                                ),
                              ),
                            );
                          })
                        ],
                      ),
                      // Container(color:Colors.orangeAccent,height: AppDeviceUtils.getScreenheight()*0.01,),
                      SizedBox(
                        // color: Colors.green,
                        height: AppDeviceUtils.getScreenheight() * 0.04,
                        width: AppDeviceUtils.getScreenWidth(),
                        child: AutoSizeText(
                          minFontSize: 12,
                          AppString.progressScreenGoalsDescription,
                          style: AppTextStyle.progressScreenDescriptionStyle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      //goals
                      Obx(() {
                        if (
                        progressScreenController.getGoalLevelsLoading.value) {
                          return Center(child: LoadingWidget(
                              height: 100, width: 100),);
                        } else if (
                        progressScreenController.goalLevelsList.isNotEmpty
                        ) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                progressScreenController
                                    .goalLevelsList.length, (index) {
                              final goalLevelItem = progressScreenController
                                  .goalLevelsList[index];
                              //
                              return DelayedWidget(
                                animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                                animationDuration: Duration(milliseconds: 600*index),
                                child: GoalsLevelsWidget(
                                  goalName: goalLevelItem.label,
                                  goalLevelsThumbnail: goalLevelItem.goalLevels,
                                ),
                              );
                            }),
                          );
                        }
                        else {
                          return
                            SizedBox(
                                height: AppDeviceUtils.getScreenheight() * 0.2,
                                // color: Colors.blue,
            
                                child: Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // Add your onPressed logic here
                                      progressScreenController
                                          .showSelectGoalsBottomSheet();
                                      // print('Set goals button pressed!');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                      Colors.black, // Dark grey background
                                      foregroundColor:
                                      Colors.white, // White text color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20.0), // Rounded corners
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 15), // Padding for size
                                    ),
                                    child: Text(
                                      'Set goals',
                                      style: TextStyle(
                                        fontSize:
                                        15, // Adjust font size as needed
                                      ),
                                    ),
                                  ),
                                ));
                        }
                      })
            
                      // :SizedBox()
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
