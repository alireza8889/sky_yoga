import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/screens/progress/controllers/progress_screen_controller.dart';
import 'package:skyyoga/screens/progress/screens/widgets/chart_lable_widget.dart';
import 'package:skyyoga/screens/progress/screens/widgets/goals_levels_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../components/text_strings.dart';
import '../../../components/text_style.dart';
import '../../../utils/device_utility.dart';
import 'package:get/get.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<GDPData> _chartData = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final progressScreenController = Get.put(ProgressScreenController());
    final bool showGoals = progressScreenController.goalLevelsList.isNotEmpty;
    final bool showDescription = progressScreenController.chartData.isEmpty;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Padding(
        padding: EdgeInsets.only(
            left: AppDeviceUtils.getScreenWidth() * 0.05,
            right: AppDeviceUtils.getScreenWidth() * 0.05,
            top: 50),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            //title and description
            Container(
              // color: Colors.blue,
              width: AppDeviceUtils.getScreenWidth(),
              height: showDescription
                  ? AppDeviceUtils.getScreenheight() * 0.11
                  : AppDeviceUtils.getScreenheight() * 0.05,
              //title and description
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: AppDeviceUtils.getScreenheight() * 0.05,
                    width: AppDeviceUtils.getScreenWidth(),
                    child: AutoSizeText(
                      AppTexts.progressScreenTitle,
                      minFontSize: 12,
                      style: AppTextStyle.progressScreenGoalsTitle,
                      maxLines: 1,
                    ),
                    // color: Colors.orangeAccent,
                  ),
                  // Container(color:Colors.orangeAccent,height: AppDeviceUtils.getScreenheight()*0.01,),
                  showDescription
                      ? Container(
                          // color: Colors.red,
                          height: AppDeviceUtils.getScreenheight() * 0.05,
                          child: AutoSizeText(
                            minFontSize: 12,
                            AppTexts.progressScreenDescription,
                            style: AppTextStyle.progressScreenDescriptionStyle,
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
            Container(
              height: AppDeviceUtils.getScreenheight() * 0.35,
              // color: Colors.green,
              child: SfCircularChart(
                palette: List.generate(
                    progressScreenController.chartData.length,
                    (index) => progressScreenController.chartData[index].color),
                series: <CircularSeries>[
                  RadialBarSeries<GDPData, String>(
                    trackBorderWidth: 1.01,
                    trackBorderColor: Colors.transparent,
                    radius: '90%',
                    innerRadius: '30%',
                    dataSource: progressScreenController.chartData.value,
                    xValueMapper: (GDPData data, _) => data.label,
                    yValueMapper: (GDPData data, _) => data.gdp,
                    maximumValue: 10,
                    cornerStyle: CornerStyle.bothCurve,
                    enableTooltip: true,
                  ),
                ],
              ),
            ),
            //chart Labels
            Wrap(
              children: List.generate(progressScreenController.chartData.length,
                  (index) {
                return ChartLabelWidget(
                    color: progressScreenController.chartData[index].color,
                    label: progressScreenController.chartData[index].label);
              }),
            ),
            //goals title and description
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: AppDeviceUtils.getScreenheight() * 0.05,
                  width: AppDeviceUtils.getScreenWidth() * 0.58,
                  // color: Colors.pink,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      AppTexts.progressScreenGoalsTitle,
                      minFontSize: 12,
                      style: AppTextStyle.progressScreenGoalsTitle,
                      maxLines: 1,
                    ),
                  ),
                ),
                Visibility(
                  visible: showGoals,
                  child: Container(
                      padding: EdgeInsets.only(top: 0, right: 5),
                      // color: Colors.orangeAccent,

                      height: AppDeviceUtils.getScreenheight() * 0.05,
                      width: AppDeviceUtils.getScreenWidth() * 0.32,
                      child: Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                              onPressed: () {
                                progressScreenController.showSelectGoalsBottomSheet();
                              },
                              child: AutoSizeText(
                                  minFontSize: 8,
                                  style: TextStyle(fontSize: 15),
                                  'Edit Goal')))),
                )
              ],
            ),
            // Container(color:Colors.orangeAccent,height: AppDeviceUtils.getScreenheight()*0.01,),
            Container(
              // color: Colors.green,
              height: AppDeviceUtils.getScreenheight() * 0.04,
              width: AppDeviceUtils.getScreenWidth(),
              child: AutoSizeText(
                minFontSize: 12,
                AppTexts.progressScreenGoalsDescription,
                style: AppTextStyle.progressScreenDescriptionStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            //goals
            showGoals

                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                        progressScreenController.goalLevelsList.length,
                        (index) {
                      final goalLevelItem =
                          progressScreenController.goalLevelsList[index];
                      //
                      return GoalsLevelsWidget(
                        goalName: goalLevelItem.label,
                        goalLevelsThumbnail: goalLevelItem.goalLevels,
                      );
                    }),
                  )
                : Container(
                    height: AppDeviceUtils.getScreenheight() * 0.2,
                    // color: Colors.blue,

                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic here
                          progressScreenController.showSelectGoalsBottomSheet();
                          // print('Set goals button pressed!');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Dark grey background
                          foregroundColor: Colors.white, // White text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(20.0), // Rounded corners
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15), // Padding for size
                        ),
                        child: Text(
                          'Set goals',
                          style: TextStyle(
                            fontSize: 15, // Adjust font size as needed
                          ),
                        ),
                      ),
                    ))
            // :SizedBox()
          ]),
        ),
      ),
    );
  }
}
