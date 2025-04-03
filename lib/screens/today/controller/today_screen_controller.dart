import 'dart:convert';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/today/screens/widgets/bottom_sheet_grid_view_item.dart';
import 'package:skyyoga/utils/device_utility.dart';
import 'package:skyyoga/widget/loading_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../components/api_constant.dart' show ApiUrlConstant;
import '../../../components/text_strings.dart';
import '../../../controller/network_manager/network_manager.dart';
import '../../../services/dio_services.dart';
import '../../../utils/helper_functions.dart';
import '../models/bottom_Sheet_pain_item_model.dart';
import '../models/mood_model.dart';

class TodayScreenController extends GetxController {
  RxDouble question1currentAnswerValue = 40.0.obs;
  RxDouble question2currentAnswerValue = 15.0.obs;

  var bottomSheetContainerHeightFactor = 0.4.obs;

  RxInt currentQuestionNumber = 1.obs;

  RxList<PainAreaModel> allPainArea = <PainAreaModel>[].obs;

  RxList<Widget> question4ColumnChildren = <Widget>[].obs;

  bool allQuestionsAnswered = false;
  DateTime lastAskFeelingQuestionTime = DateTime(0);

  RxString selectedMood = ''.obs;

  RxBool getPainAreaLoading = false.obs;
  RxBool getMoodsLoading = false.obs;
  RxBool sendFeelingAnswersLoading = false.obs;
  RxList<Mood> allMoods = RxList<Mood>();

  double _getClosestValueForQuestion1(double value) {
    if (value < 11.11) return 0;
    if (value < 22.22) return 11.11;
    if (value < 33.33) return 22.22;
    if (value < 44.44) return 33.33;
    if (value < 55.55) return 44.44;
    if (value < 66.66) return 55.55;
    if (value < 77.77) return 66.66;
    if (value < 88.88) return 77.77;
    if (value <= 95) return 88.88; // تغییر در این شرط
    return 100;
  }

  double _getClosestValueForQuestion2(double value) {
    if (value < 15.0) return 15;
    if (value < 30.0) return 15.0;
    if (value < 45.0) return 30.0;
    if (value < 60.0) return 45.0;
    if (value < 75.0) return 60.0;
    if (value < 80.0) return 75.0;
    // تغییر در این شرط
    return 90;
  }

  String getClosestValue() {
    if (question1currentAnswerValue.value < 33.33) return 'chill';
    if (question1currentAnswerValue.value < 66.66) return 'moderate';
    // تغییر در این شرط
    return 'challenging';
  }

  void updateValue(double newValue) {
    question1currentAnswerValue.value = newValue; // به‌روزرسانی مقدار
  }

  void selectPains(String painName) {
    final index =
        allPainArea.indexWhere((element) => element.label == painName);
    allPainArea[index].isSelected.value = !allPainArea[index].isSelected.value;
  }

  String token = '';

  String formatDoubleMinutesToDuration(double minutes) {
    Duration duration = Duration(
        seconds: (minutes * 60).toInt()); // تبدیل دقیقه به ثانیه و سپس Duration
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String formattedDuration =
        "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    return formattedDuration;
  }

// ...

  Future<void> getNewToken() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenn = prefs.getString('access_token');
    token = tokenn!;
  }

  Future<void> getAllPainArea() async {
    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AppHelperFunctions.showSnackBar('No Internet Connection');
      return;
    }

    // // Set loading state to true
    allPainArea.clear();

    getPainAreaLoading.value = true;

    // Define the API endpoint URL
    final String url = ApiUrlConstant.getAllPainArea;

    // Initialize DioServices for making HTTP requests
    final dioServices = DioServices();

    try {
      // Refresh the token if necessary
      await getNewToken();
      // Make a GET request with Bearer token
      final response = await dioServices.getMethodBearer({}, url, token);
      // Check if the response status code is 200 (OK)
      print('response date pain area:${response.data}');

      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseData = response.data;

        // Access the 'data' field from the response
        List<dynamic> jsonResponse = responseData['data'];

        // Convert the JSON data into a list of SuggestedExerciseModel objects
        List<PainAreaModel> painAreas = jsonResponse
            .map((painArea) => PainAreaModel.fromJson(painArea))
            .toList();

        // Assign the fetched data to the observable list
        allPainArea.assignAll(painAreas);

        // Set loading state to false
        getPainAreaLoading.value = false;
        print('pain area got');
      } else {
        // Handle non-200 status codes
        getPainAreaLoading.value = false;
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      getPainAreaLoading.value = false;
      print('Error: $e');
    }
  }

  Future<void> getAllMoodsForSelectMoodScreen() async {
    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AppHelperFunctions.showSnackBar('No Internet Connection');
      return;
    }

    getMoodsLoading.value = true;

    final String url = ApiUrlConstant.getAllMoodsForSelectMoodScreen;
    final dioServices = DioServices();

    try {
      await getNewToken();
      final response = await dioServices.getMethodBearer({}, url, token);

      print('response get moods: ${response.data}');

      if (response.statusCode == 200) {
        final responseData = response.data;
        List<dynamic> jsonResponse = responseData['data'];

        // تبدیل داده‌های JSON به لیست Mood
        List<Mood> moods =
            jsonResponse.map((json) => Mood.fromJson(json)).toList();

        // فرض بر این است که allMoods یک RxList<Mood> است.
        // و شما آن را در اینجا مقدار دهی می کنید.

        allMoods.assignAll(moods);

        getMoodsLoading.value = false;
        print('moods got');
      } else {
        getMoodsLoading.value = false;
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      getMoodsLoading.value = false;
      print('Error: $e');
    }
  }


  Future<bool> sendFeelingAnswers() async {
// Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AppHelperFunctions.showSnackBar('No Internet Connection');
      return false;
    }
    final dioServices = DioServices();
    final String url = ApiUrlConstant.sendAllfeelingAnswers;
    final map = {
      'feeling': selectedMood.value.toLowerCase(),
      'exercise_time':
          formatDoubleMinutesToDuration(question2currentAnswerValue.value),
      'exercise_level': getClosestValue(),
    };

    try {
      sendFeelingAnswersLoading.value = true;
      // Refresh the token if necessary
      await getNewToken();
      print('map data:$map');
      print('send fleeling methid called');
      // Make a GET request with Bearer token
      final response = await dioServices.patchMethodBearer(map, url, token);
      // Check if the response status code is 200 (OK)
      print('response send feeling answers:${response.data}');

      if (response.statusCode == 200) {
        // Parse the JSON response

        sendFeelingAnswersLoading.value = false;

        print('status code 200');
        //update last answer time
        // saveAnswerTime();
        return true;
      } else {
        // selectGoalsLoading.value = false;
        print('status code :error');
        sendFeelingAnswersLoading.value = false;

        return false;
      }
    } catch (e) {
      sendFeelingAnswersLoading.value = false;

      //
      return false;
    }
    //send all Answers
    //ans
  }

  Future<bool> sendSelectedPainAreasAnswers() async {
// Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AppHelperFunctions.showSnackBar('No Internet Connection');
      return false;
    }
    final dioServices = DioServices();
    final String url = ApiUrlConstant.sendAllSelectedPainAreasAnswers;

    final List<Map<String, dynamic>> map =
        List.generate(allPainArea.length, (index) {
      return {'body_part': allPainArea[index].id};
    });

    //sending feeling answers before sending painAreaAnswers
    final responseSendFeeling = await sendFeelingAnswers();
    if (responseSendFeeling == false) {
      return false;
    }

    //
    try {
      sendFeelingAnswersLoading.value = true;
      // Refresh the token if necessary
      await getNewToken();
      print('map data:$map');
      print('send selected pain areas called');
      // Make a GET request with Bearer token
      final response =
          await dioServices.postMethodBearerForBulkCreate(map, url, token);
      // Check if the response status code is 200 (OK)
      print('response send selected pain areas:${response.data}');

      if (response.statusCode == 201) {
        // Parse the JSON response

        sendFeelingAnswersLoading.value = false;

        print('status code 201');
        return true;
      } else {
        // selectGoalsLoading.value = false;
        print('status code :error${response.statusCode}');
        sendFeelingAnswersLoading.value = false;

        return false;
      }
    } catch (e) {
      sendFeelingAnswersLoading.value = false;

      //
      return false;
    }
    //send all Answers
    //ans
  }

//save last answer time
  Future<void> saveAnswerTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DateTime now = DateTime.now();
    String formattedTime = now.toIso8601String(); // تبدیل زمان به رشته ISO 8601

    // ذخیره زمان با استفاده از کلید منحصر به فرد برای هر سوال
    prefs.setString('last_answer_time', formattedTime);
  }

//check last answer time
  Future<bool> isAnswerTimeExpired() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTime = prefs.getString('last_answer_time');

    if (savedTime == null) {
      // اگر زمانی ذخیره نشده باشد، false برگردان
      return false;
    }

    DateTime parsedTime = DateTime.parse(savedTime);
    DateTime now = DateTime.now();

    // محاسبه تفاوت زمانی
    Duration difference = now.difference(parsedTime);

    // بررسی اگر تفاوت زمانی بیشتر از 24 ساعت است
    return difference.inHours >= 24;
  }

  void addQuestion4ColumnChildren() async {
    question4ColumnChildren.clear();

    await getAllPainArea();

    Future.delayed(Duration(milliseconds: 500)).then((value) {
      question4ColumnChildren.add(DelayedWidget(
        delayDuration: Duration(milliseconds: 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: AppDeviceUtils.getScreenWidth(),
                // Using AppDeviceUtils (Potential Issue)
                height: AppDeviceUtils.getScreenheight() * 0.1,
                // Using AppDeviceUtils (Potential Issue)
                // color: Colors.blue,
                child: AutoSizeText(
                  minFontSize: 17,
                  maxLines: 3,
                  AppTexts.todayScreenBottomSheetQuestion4,
                  style: AppTextStyle.todayScreenBottomSheetQuestion4,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: AppDeviceUtils.getScreenWidth() * 0.03,
                    right: AppDeviceUtils.getScreenWidth() * 0.03,
                    top: 0),
                height: AppDeviceUtils.getScreenheight() * 0.45,
                // color: Colors.green,
                child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: AppDeviceUtils.getScreenheight() * 0.01,
                      crossAxisSpacing: AppDeviceUtils.getScreenWidth() * 0.02,
                      maxCrossAxisExtent: AppDeviceUtils.getScreenWidth() * 0.3,
                      childAspectRatio: 1.2,
                    ),
                    children: List.generate(8, (index) {
                      final painItem = allPainArea[index];
                      return GestureDetector(
                          onTap: () {
                            selectPains(painItem.label);
                          },
                          child: BottomSheetGridViewItem(
                              isSelected: painItem.isSelected,
                              label: painItem.label,
                              imagePath: painItem.imageUrl));
                    })),
              ),
              //divider
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: AppDeviceUtils.getScreenheight() * 0.008),
                child: Divider(
                    // color: Colors.black,
                    ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                // color: Colors.red,
                height: AppDeviceUtils.getScreenheight() * 0.14,
                child: GridView(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: AppDeviceUtils.getScreenheight() * 0.01,
                      crossAxisSpacing: AppDeviceUtils.getScreenWidth() * 0.02,
                      maxCrossAxisExtent: AppDeviceUtils.getScreenWidth() * 0.4,
                      childAspectRatio: 0.9,
                    ),
                    children: List.generate(allPainArea.length - 8, (index) {
                      final painItem =
                          allPainArea[allPainArea.length - index - 1];
                      return GestureDetector(
                          onTap: () {
                            selectPains(painItem.label);
                          },
                          child: BottomSheetGridViewItem(
                              isSelected: painItem.isSelected,
                              label: painItem.label,
                              imagePath: painItem.imageUrl));
                    })),
              ),
              Container(
                // color: Colors.black,
                height: AppDeviceUtils.getScreenheight() * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () async {
                    //send answers
                    final res = await sendSelectedPainAreasAnswers();
                    if (res) {
                      Get.back();
                    } else {
                      return;
                    }
                  },
                  child: Obx(() {
                    final activeButton = allPainArea.isNotEmpty;
                    return Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: activeButton
                            ? AppWidgetColor.todayBottomSheetOkActiveButtonColor
                            : AppWidgetColor
                                .todayBottomSheetOkNotActiveButtonColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(child: Obx(() {
                        if (sendFeelingAnswersLoading.value) {
                          return CircularProgressIndicator(
                            color: Colors.white,
                          );
                        }
                        return Text(
                          AppTexts.todayQuestion4OkButton,
                          style: AppTextStyle
                              .todayScreenBottomSheetQuestionOkButton,
                        );
                      })),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ));
    });
  }

  void showSelectUserLimitBottomSheet() {
    Get.bottomSheet(
      Obx(() {
        final heightFactor = bottomSheetContainerHeightFactor.value;
        return AnimatedContainer(
          width: double.infinity,
          height: AppDeviceUtils.getScreenheight() * heightFactor,
          // 70% of the screen height
          duration: Duration(milliseconds: 500),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            child: Stack(children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                    color: Colors.transparent,
                  ),
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: AppWidgetColor.todayScreenBottomSheetBackGround,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                  ),
                  child: Obx(() {
                    //question 1
                    if (currentQuestionNumber.value == 1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: AppDeviceUtils.getScreenheight() * 0.03,
                            // color: Colors.purpleAccent,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: AppDeviceUtils.getScreenWidth(),
                            height: AppDeviceUtils.getScreenheight() * 0.05,
                            // color: Colors.blue,
                            child: AutoSizeText(
                                minFontSize: 15,
                                AppTexts.todayScreenBottomSheetQuestion1,
                                style: AppTextStyle
                                    .todayScreenBottomSheetQuestion),
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            // تنظیم تراز برای قرار دادن دکمه در پایین
                            children: [
                              Container(
                                height:
                                    (AppDeviceUtils.getScreenheight() * 0.18) +
                                        50,
                                // color: Colors.red,
                                child: Obx(() {
                                  return SfRadialGauge(
                                    axes: <RadialAxis>[
                                      RadialAxis(
                                        onAxisTapped: (value) {
                                          question1currentAnswerValue.value =
                                              value;
                                        },
                                        minimum: 0,
                                        maximum: 100,
                                        startAngle: 180,
                                        endAngle: 0,
                                        showTicks: false,
                                        showLabels: false,

                                        axisLineStyle: AxisLineStyle(
                                          thickness:
                                              AppDeviceUtils.getScreenWidth() *
                                                  0.05,
                                          color: Colors.grey[300],
                                          cornerStyle: CornerStyle.bothCurve,
                                        ),
                                        pointers: <GaugePointer>[
                                          RangePointer(

                                            cornerStyle: CornerStyle.bothCurve,
                                            value: _getClosestValueForQuestion1(
                                                question1currentAnswerValue
                                                    .value),
                                            width: AppDeviceUtils
                                                    .getScreenWidth() *
                                                0.05,
                                            gradient: SweepGradient(
                                              colors: AppWidgetColor
                                                  .todayQuestion1Gradient,
                                            ),
                                            animationDuration: 300,
                                            enableAnimation: true,
                                            enableDragging: true,
                                            onValueChanged: (double value) {
                                              question1currentAnswerValue
                                                      .value =
                                                  _getClosestValueForQuestion1(
                                                      value);
                                            },
                                          ),
                                        ],
                                        annotations: <GaugeAnnotation>[
                                          GaugeAnnotation(
                                            widget: Container(
                                              padding:
                                                  EdgeInsets.only(right: 5),
                                              child: Text(
                                                'Easy',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            angle: 180,
                                            positionFactor: 1.3,
                                          ),
                                          GaugeAnnotation(
                                            widget: Container(
                                              padding: EdgeInsets.only(left: 5),
                                              child: Text(
                                                'Hard',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            angle: 0,
                                            positionFactor: 1.3,
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }),
                              ),
                              Positioned(
                                // برای قرار دادن دکمه در موقعیت دلخواه
                                bottom: AppDeviceUtils.getScreenheight() *
                                    0.01, // قرار دادن دکمه در پایین Stack
                                left: 20, // تنظیم فاصله از چپ
                                right: 20, // تنظیم فاصله از راست
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  // Padding را حذف کنید اگر نیاز ندارید
                                  child: GestureDetector(
                                    onTap: () {
                                      currentQuestionNumber.value++;
                                    },
                                    child: Container(
                                      height: 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppWidgetColor
                                            .todayScreenGetStartBackGround,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          AppTexts.todayContinueButton,
                                          style: TextStyle(
                                              color: AppTextColor
                                                  .getStartButtonText),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                      //question 2
                    } else if (currentQuestionNumber.value == 2) {
                      return DelayedWidget(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: AppDeviceUtils.getScreenheight() * 0.03,
                              // color: Colors.purpleAccent,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: AppDeviceUtils.getScreenWidth(),
                              height: AppDeviceUtils.getScreenheight() * 0.05,
                              // color: Colors.blue,
                              child: AutoSizeText(
                                  minFontSize: 15,
                                  AppTexts.todayScreenBottomSheetQuestion2,
                                  style: AppTextStyle
                                      .todayScreenBottomSheetQuestion),
                            ),
                            Container(
                              height: AppDeviceUtils.getScreenheight() * 0.18,
                              child: Obx(() {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: SfRadialGauge(
                                    axes: <RadialAxis>[
                                      RadialAxis(
                                        onAxisTapped: (value) {
                                          question2currentAnswerValue.value =
                                              _getClosestValueForQuestion2(value);
                                        },
                                        minimum: 0,
                                        maximum: 90,
                                        startAngle: 270,
                                        endAngle: 269,
                                        showTicks: false,
                                        showLabels: false,
                                        axisLineStyle: AxisLineStyle(
                                          thickness:
                                              AppDeviceUtils.getScreenWidth() *
                                                  0.04,
                                          color: Colors.grey[300],
                                          cornerStyle: CornerStyle.bothCurve,
                                        ),
                                        pointers: <GaugePointer>[
                                          RangePointer(
                                            cornerStyle: CornerStyle.bothCurve,
                                            value: question2currentAnswerValue
                                                .value,
                                            width: AppDeviceUtils
                                                    .getScreenWidth() *
                                                0.04,
                                            color: Colors.blue,
                                            animationDuration: 300,
                                            enableAnimation: true,
                                            enableDragging: true,
                                            onValueChanged: (double value) {
                                              double newValue = _getClosestValueForQuestion2(value);
                                              if (question2currentAnswerValue.value != newValue) {
                                                question2currentAnswerValue.value = newValue;
                                                question2currentAnswerValue.refresh();
                                              }
                                            },
                                          ),
                                        ],
                                        annotations: <GaugeAnnotation>[
                                          GaugeAnnotation(
                                            widget: Obx(() {
                                              return Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Spacer(flex: 2),
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      minFontSize: 6,
                                                      '${question2currentAnswerValue.value.toStringAsFixed(0)}:00',
                                                      style: AppTextStyle
                                                          .todayScreenQuestion2TimeTextStyle,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: AutoSizeText(
                                                      minFontSize: 6,
                                                      'Min',
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  Spacer(flex: 2),
                                                ],
                                              );
                                            }),
                                            angle: 90,
                                            positionFactor: 0.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  currentQuestionNumber.value++;
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: AppWidgetColor
                                          .todayScreenGetStartBackGround,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    AppTexts.todayContinueButton,
                                    style: TextStyle(
                                        color: AppTextColor.getStartButtonText),
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                      //question 3
                    } else if (currentQuestionNumber.value == 3) {
                      return DelayedWidget(
                        animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: AppDeviceUtils.getScreenheight() * 0.03,
                              // color: Colors.purpleAccent,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: AppDeviceUtils.getScreenWidth(),
                              height: AppDeviceUtils.getScreenheight() * 0.07,
                              // color: Colors.blue,
                              child: AutoSizeText(
                                  minFontSize: 15,
                                  AppTexts.todayScreenBottomSheetQuestion3,
                                  style: AppTextStyle
                                      .todayScreenBottomSheetQuestion),
                            ),
                            SizedBox(
                              height: AppDeviceUtils.getScreenheight() * 0.20,
                              // color: Colors.red,
                              child: Column(
                                children: [
                                  Container(
                                    height:
                                        AppDeviceUtils.getScreenheight() * 0.02,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        //increase bottom sheet height
                                        currentQuestionNumber.value++;
                                        bottomSheetContainerHeightFactor.value =
                                            0.86;
                                        //add items
                                        addQuestion4ColumnChildren();
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: AppWidgetColor
                                                    .todayScreenQuestion3YesOrNoBorder)),
                                        child: Center(
                                            child: Text(
                                          AppTexts.todayQuestion3YesButton,
                                          style: TextStyle(
                                              color: AppWidgetColor
                                                  .todayQuestion3YesOrNoButtonColor),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height:
                                        AppDeviceUtils.getScreenheight() * 0.03,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        final res = await sendFeelingAnswers(
                                            // painAreas: selectedPainArea,
                                            );

                                        if (res) {
                                          Get.back();
                                        } else {
                                          AppHelperFunctions.showSnackBar(
                                              'Error sending answers');
                                          //show not send snackbar
                                        }
                                      },
                                      child: Container(
                                        height: 50,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: AppWidgetColor
                                                    .todayScreenQuestion3YesOrNoBorder)),
                                        child: Center(child: Obx(() {
                                          if (sendFeelingAnswersLoading.value) {
                                            return Center(
                                              child: CircularProgressIndicator(
                                                color: Colors.black,
                                              ),
                                            );
                                          }
                                          return Text(
                                            AppTexts.todayQuestion3NoButton,
                                            style: TextStyle(
                                                color: AppWidgetColor
                                                    .todayQuestion3YesOrNoButtonColor),
                                          );
                                        })),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                      //question 4
                    } else if (currentQuestionNumber.value == 4) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: AppDeviceUtils.getScreenheight() * 0.03,
                            // color: Colors.purpleAccent,
                          ),

                          Obx(() {
                            if (getPainAreaLoading.value) {
                              return Center(
                                child: LoadingWidget(height: 100, width: 100),
                              );
                            }
                            return Obx(() {
                              if (question4ColumnChildren.isNotEmpty) {
                                return Column(
                                  children: question4ColumnChildren,
                                );
                              } else {
                                return SizedBox();
                              }
                            });
                          }),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          //   child: Divider(),
                          // )
                        ],
                      );
                    } else {
                      return SizedBox();
                    }
                  })),
            ]),
          ),
        );
      }),
      enterBottomSheetDuration: Duration(milliseconds: 400),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
    );
  }
}
