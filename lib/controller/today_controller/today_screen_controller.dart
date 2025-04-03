// import 'dart:ui';
//
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:delayed_widget/delayed_widget.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:skyyoga/components/text_style.dart';
// import 'package:skyyoga/res/colors.dart';
// import 'package:skyyoga/res/string.dart';
// import 'package:skyyoga/screens/today/screens/mood_selection_screen.dart';
// import 'package:skyyoga/screens/today/screens/widgets/bottom_sheet_grid_view_item.dart';
// import 'package:skyyoga/utils/device_utility.dart';
// import 'package:syncfusion_flutter_gauges/gauges.dart';
//
// import '../../screens/today/models/bottom_Sheet_pain_item_model.dart';
//
// class TodayScreenController extends GetxController {
//   var question1currentAnswerValue = 40.0.obs;
//   var question2currentAnswerValue = 15.0.obs;
//
//   var bottomSheetContainerHeightFactor = 0.4.obs;
//
//   RxInt currentQuestionNumber = 1.obs;
//
//   RxList<PainGridItemModel> allPainArea = <PainGridItemModel>[
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label1', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label2', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label3', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label4', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label5', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label6', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label7', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label8', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label9', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label10', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label11', imagePath: 'imagePath'),
//     PainGridItemModel(
//         isSelected: false.obs, label: 'label12', imagePath: 'imagePath'),
//   ].obs;
//
//   RxList<Widget> question4ColumnChildren = <Widget>[].obs;
//
//   bool allQuestionsAnswered = false;
//
//   double _getClosestValue(double value) {
//     if (value < 11.11) return 0;
//     if (value < 22.22) return 11.11;
//     if (value < 33.33) return 22.22;
//     if (value < 44.44) return 33.33;
//     if (value < 55.55) return 44.44;
//     if (value < 66.66) return 55.55;
//     if (value < 77.77) return 66.66;
//     if (value < 88.88) return 77.77;
//     if (value <= 95) return 88.88;
//     return 100;
//   }
//
//   void updateValue(double newValue) {
//     question1currentAnswerValue.value = newValue;
//   }
//
//   void selectPains(String painName) {
//     final index =
//         allPainArea.indexWhere((element) => element.label == painName);
//     allPainArea[index].isSelected.value = !allPainArea[index].isSelected.value;
//   }
//
//   Future<void> sendAllAnswers() async {}
//
//   void addQuestion4ColumnChildren(BuildContext context) {
//     Future.delayed(Duration(milliseconds: 500)).then((value) {
//       question4ColumnChildren.add(DelayedWidget(
//         delayDuration: Duration(milliseconds: 0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               width: AppDeviceUtils.getScreenWidth(),
//               height: AppDeviceUtils.getScreenheight() * 0.1,
//               child: AutoSizeText(
//                 minFontSize: 17,
//                 maxLines: 3,
//                 AppString.todayScreenBottomSheetQuestion4,
//                 style: AppTextStyle.todayScreenBottomSheetQuestion4,
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.only(
//                   left: AppDeviceUtils.getScreenWidth() * 0.03,
//                   right: AppDeviceUtils.getScreenWidth() * 0.03,
//                   top: 0),
//               height: AppDeviceUtils.getScreenheight() * 0.45,
//               child: GridView(
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                     mainAxisSpacing: AppDeviceUtils.getScreenheight() * 0.01,
//                     crossAxisSpacing: AppDeviceUtils.getScreenWidth() * 0.02,
//                     maxCrossAxisExtent: AppDeviceUtils.getScreenWidth() * 0.3,
//                     childAspectRatio: 1.2,
//                   ),
//                   children: List.generate(9, (index) {
//                     final painItem = allPainArea[index];
//                     return GestureDetector(
//                         onTap: () {
//                           selectPains(painItem.label);
//                         },
//                         child: BottomSheetGridViewItem(
//                             isSelected: painItem.isSelected,
//                             label: painItem.label,
//                             imagePath: painItem.imagePath));
//                   })),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: 8.0,
//                   vertical: AppDeviceUtils.getScreenheight() * 0.008),
//               child: Divider(),
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 10, right: 10, top: 0),
//               height: AppDeviceUtils.getScreenheight() * 0.14,
//               child: GridView(
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                     mainAxisSpacing: AppDeviceUtils.getScreenheight() * 0.01,
//                     crossAxisSpacing: AppDeviceUtils.getScreenWidth() * 0.02,
//                     maxCrossAxisExtent: AppDeviceUtils.getScreenWidth() * 0.3,
//                     childAspectRatio: 1.2,
//                   ),
//                   children: List.generate(3, (index) {
//                     final painItem =
//                         allPainArea[allPainArea.length - index - 1];
//                     return GestureDetector(
//                         onTap: () {
//                           selectPains(painItem.label);
//                         },
//                         child: BottomSheetGridViewItem(
//                             isSelected: painItem.isSelected,
//                             label: painItem.label,
//                             imagePath: painItem.imagePath));
//                   })),
//             ),
//             Container(
//               height: AppDeviceUtils.getScreenheight() * 0.01,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Obx(() {
//                   final activeButton = allPainArea.isNotEmpty;
//                   return Container(
//                     height: 50,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: activeButton
//                           ? AppWidgetColor.todayBottomSheetOkActiveButtonColor
//                           : AppWidgetColor
//                               .todayBottomSheetOkNotActiveButtonColor,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Center(
//                         child: Text(
//                       AppString.todayQuestion4OkButton,
//                       style:
//                           AppTextStyle.todayScreenBottomSheetQuestionOkButton,
//                     )),
//                   );
//                 }),
//               ),
//             ),
//           ],
//         ),
//       ));
//     });
//   }
//
//   void showSelectUserLimitBottomSheet(BuildContext context) {
//     Get.bottomSheet(
//       Obx(() {
//         final heightFactor = bottomSheetContainerHeightFactor.value;
//         return AnimatedContainer(
//           width: double.infinity,
//           height: AppDeviceUtils.getScreenheight() * heightFactor,
//           duration: Duration(milliseconds: 500),
//           child: ClipRRect(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//             child: Stack(children: [
//               BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.transparent,
//                   ),
//                 ),
//               ),
//               Container(
//                   decoration: BoxDecoration(
//                     color: AppWidgetColor.todayScreenBottomSheetBackGround,
//                     borderRadius:
//                         BorderRadius.vertical(top: Radius.circular(30)),
//                   ),
//                   child: Obx(() {
//                     if (currentQuestionNumber.value == 1) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: AppDeviceUtils.getScreenheight() * 0.03,
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             width: AppDeviceUtils.getScreenWidth(),
//                             height: AppDeviceUtils.getScreenheight() * 0.07,
//                             child: AutoSizeText(
//                                 minFontSize: 15,
//                                 AppString.todayScreenBottomSheetQuestion1,
//                                 style: AppTextStyle
//                                     .todayScreenBottomSheetQuestion),
//                           ),
//                           SizedBox(
//                             height: AppDeviceUtils.getScreenheight() * 0.18,
//                             child: Obx(() {
//                               return SfRadialGauge(
//                                 axes: <RadialAxis>[
//                                   RadialAxis(
//                                     onAxisTapped: (value) {
//                                       question1currentAnswerValue.value = value;
//                                     },
//                                     minimum: 0,
//                                     maximum: 100,
//                                     startAngle: 180,
//                                     endAngle: 0,
//                                     showTicks: false,
//                                     showLabels: false,
//                                     axisLineStyle: AxisLineStyle(
//                                       thickness:
//                                           AppDeviceUtils.getScreenWidth() *
//                                               0.04,
//                                       color: Colors.grey[300],
//                                       cornerStyle: CornerStyle.bothCurve,
//                                     ),
//                                     pointers: <GaugePointer>[
//                                       RangePointer(
//                                         cornerStyle: CornerStyle.bothCurve,
//                                         value: _getClosestValue(
//                                             question1currentAnswerValue.value),
//                                         width: AppDeviceUtils.getScreenWidth() *
//                                             0.04,
//                                         gradient: SweepGradient(
//                                           colors: AppWidgetColor
//                                               .todayQuestion1Gradient,
//                                         ),
//                                         enableAnimation: false,
//                                         enableDragging: true,
//                                         onValueChanged: (double value) {
//                                           question1currentAnswerValue.value =
//                                               _getClosestValue(value);
//                                         },
//                                       ),
//                                     ],
//                                     annotations: <GaugeAnnotation>[
//                                       GaugeAnnotation(
//                                         widget: Container(
//                                           padding: EdgeInsets.only(right: 5),
//                                           child: Text(
//                                             'Easy',
//                                             style: TextStyle(fontSize: 16),
//                                           ),
//                                         ),
//                                         angle: 180,
//                                         positionFactor: 1.3,
//                                       ),
//                                       GaugeAnnotation(
//                                         widget: Container(
//                                           padding: EdgeInsets.only(left: 5),
//                                           child: Text(
//                                             'Hard',
//                                             style: TextStyle(fontSize: 16),
//                                           ),
//                                         ),
//                                         angle: 0,
//                                         positionFactor: 1.3,
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               );
//                             }),
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 20.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 currentQuestionNumber.value++;
//                               },
//                               child: Container(
//                                 height: 50,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: AppWidgetColor
//                                         .todayScreenGetStartBackGround,
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: Center(
//                                     child: Text(
//                                   AppString.todayContinueButton,
//                                   style: TextStyle(
//                                       color: AppTextColor.getStartButtonText),
//                                 )),
//                               ),
//                             ),
//                           )
//                         ],
//                       );
//                     } else if (currentQuestionNumber.value == 2) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: AppDeviceUtils.getScreenheight() * 0.03,
//                           ),
//                           DelayedWidget(
//                             animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
//                             child: Container(
//                               padding: EdgeInsets.symmetric(horizontal: 20),
//                               width: AppDeviceUtils.getScreenWidth(),
//                               height: AppDeviceUtils.getScreenheight() * 0.05,
//                               child: AutoSizeText(
//                                   minFontSize: 15,
//                                   AppString.todayScreenBottomSheetQuestion2,
//                                   style: AppTextStyle
//                                       .todayScreenBottomSheetQuestion),
//                             ),
//                           ),
//                           SizedBox(
//                             height: AppDeviceUtils.getScreenheight() * 0.17,
//                             child: Obx(() {
//                               return DelayedWidget(
//                                   animation:
//                                       DelayedAnimations.SLIDE_FROM_BOTTOM,
//                                   child: Padding(
//                                     padding:
//                                         const EdgeInsets.only(bottom: 10.0),
//                                     child: SfRadialGauge(
//                                       axes: <RadialAxis>[
//                                         RadialAxis(
//                                           onAxisTapped: (value) {
//                                             question2currentAnswerValue.value =
//                                                 value;
//                                           },
//                                           minimum: 0,
//                                           maximum: 60,
//                                           startAngle: 270,
//                                           endAngle: 270,
//                                           showTicks: false,
//                                           showLabels: false,
//                                           axisLineStyle: AxisLineStyle(
//                                             thickness: AppDeviceUtils
//                                                     .getScreenWidth() *
//                                                 0.04,
//                                             color: Colors.grey[300],
//                                             cornerStyle: CornerStyle.bothCurve,
//                                           ),
//                                           pointers: <GaugePointer>[
//                                             RangePointer(
//                                               cornerStyle:
//                                                   CornerStyle.bothCurve,
//                                               value: question2currentAnswerValue
//                                                   .value,
//                                               width: AppDeviceUtils
//                                                       .getScreenWidth() *
//                                                   0.04,
//                                               color: Colors.blue,
//                                               enableAnimation: false,
//                                               enableDragging: true,
//                                               onValueChanged: (double value) {
//                                                 question2currentAnswerValue
//                                                     .value = value;
//                                                 print(value.toString());
//                                               },
//                                             ),
//                                           ],
//                                           annotations: <GaugeAnnotation>[
//                                             GaugeAnnotation(
//                                               widget: Obx(() {
//                                                 return Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceEvenly,
//                                                   children: [
//                                                     Spacer(
//                                                       flex: 2,
//                                                     ),
//                                                     Expanded(
//                                                       child: AutoSizeText(
//                                                           minFontSize: 6,
//                                                           '${question2currentAnswerValue.value.toStringAsFixed(0)}:00',
//                                                           style: AppTextStyle
//                                                               .todayScreenQuestion2TimeTextStyle),
//                                                     ),
//                                                     Expanded(
//                                                       child: AutoSizeText(
//                                                         minFontSize: 6,
//                                                         'Min',
//                                                         style: TextStyle(
//                                                             fontSize: 16),
//                                                       ),
//                                                     ),
//                                                     Spacer(
//                                                       flex: 2,
//                                                     ),
//                                                   ],
//                                                 );
//                                               }),
//                                               angle: 90,
//                                               positionFactor: 0.0,
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ));
//                             }),
//                           ),
//                           Container(
//                             height: AppDeviceUtils.getScreenheight() * 0.02,
//                           ),
//                           Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 20.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 currentQuestionNumber.value++;
//                               },
//                               child: Container(
//                                 height: 50,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                     color: AppWidgetColor
//                                         .todayScreenGetStartBackGround,
//                                     borderRadius: BorderRadius.circular(15)),
//                                 child: Center(
//                                     child: Text(
//                                   AppString.todayContinueButton,
//                                   style: TextStyle(
//                                       color: AppTextColor.getStartButtonText),
//                                 )),
//                               ),
//                             ),
//                           )
//                         ],
//                       );
//                     } else if (currentQuestionNumber.value == 3) {
//                       return DelayedWidget(
//                         animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               height: AppDeviceUtils.getScreenheight() * 0.03,
//                             ),
//                             Container(
//                               padding: EdgeInsets.symmetric(horizontal: 20),
//                               width: AppDeviceUtils.getScreenWidth(),
//                               height: AppDeviceUtils.getScreenheight() * 0.07,
//                               child: AutoSizeText(
//                                   minFontSize: 15,
//                                   AppString.todayScreenBottomSheetQuestion1,
//                                   style: AppTextStyle
//                                       .todayScreenBottomSheetQuestion),
//                             ),
//                             SizedBox(
//                               height: AppDeviceUtils.getScreenheight() * 0.20,
//                               child: Column(
//                                 children: [
//                                   Container(
//                                     height:
//                                         AppDeviceUtils.getScreenheight() * 0.02,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20.0),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         currentQuestionNumber.value++;
//                                         bottomSheetContainerHeightFactor.value =
//                                             0.86;
//                                         addQuestion4ColumnChildren(context);
//                                       },
//                                       child: Container(
//                                         height: 50,
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(15),
//                                             border: Border.all(
//                                                 color: AppWidgetColor
//                                                     .todayScreenQuestion3YesOrNoBorder)),
//                                         child: Center(
//                                             child: Text(
//                                           AppString.todayQuestion3YesButton,
//                                           style: TextStyle(
//                                               color: AppWidgetColor
//                                                   .todayQuestion3YesOrNoButtonColor),
//                                         )),
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     height:
//                                         AppDeviceUtils.getScreenheight() * 0.03,
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 20.0),
//                                     child: GestureDetector(
//                                       onTap: () {
//                                         Get.back();
//                                         Get.to(MoodSelectionScreen());
//                                       },
//                                       child: Container(
//                                         height: 50,
//                                         width: double.infinity,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(15),
//                                             border: Border.all(
//                                                 color: AppWidgetColor
//                                                     .todayScreenQuestion3YesOrNoBorder)),
//                                         child: Center(
//                                             child: Text(
//                                           AppString.todayQuestion3NoButton,
//                                           style: TextStyle(
//                                               color: AppWidgetColor
//                                                   .todayQuestion3YesOrNoButtonColor),
//                                         )),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else if (currentQuestionNumber.value == 4) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             height: AppDeviceUtils.getScreenheight() * 0.03,
//                           ),
//                           Obx(() {
//                             if (question4ColumnChildren.isEmpty) {
//                               return SizedBox();
//                             } else {
//                               return Column(
//                                 children: question4ColumnChildren,
//                               );
//                             }
//                           }),
//                         ],
//                       );
//                     } else {
//                       return SizedBox();
//                     }
//                   })),
//             ]),
//           ),
//         );
//       }),
//       enterBottomSheetDuration: Duration(milliseconds: 400),
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       barrierColor: Colors.transparent,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
//       ),
//     );
//   }
// }
