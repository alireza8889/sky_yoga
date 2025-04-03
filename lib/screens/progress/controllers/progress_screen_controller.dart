import 'package:auto_size_text/auto_size_text.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/progress/models/goal_level_thumbnail_model.dart';
import 'package:skyyoga/screens/progress/models/goal_levels_model.dart';
import 'package:skyyoga/screens/progress/screens/widgets/select_goals_gridview_item.dart';
import 'package:skyyoga/utils/device_utility.dart';
import 'package:skyyoga/widget/loading_widget.dart';

import '../../../components/api_constant.dart';
import '../../../components/text_strings.dart';
import '../../../controller/network_manager/network_manager.dart';
import '../../../services/dio_services.dart';
import '../../../utils/helper_functions.dart';
import '../models/chart_data_model.dart';
import '../models/gdp_model_for_chart.dart';
import '../models/select_goals_item_model.dart';

class ProgressScreenController extends GetxController {


  int findFirstInProcessIndex(List<GoalLevelThumbNailModel> thumbnails) {
    return thumbnails.indexWhere((item) => !item.isDone);
  }
  RxList<GoalLevelsModel> goalLevelsList = <GoalLevelsModel>[
    GoalLevelsModel(label: 'chill', goalLevels: [

      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpOoTDhEiV6RC9__Rx0Y0n2hSQMyKYj0UGrg&s',
          isDone: true,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpOoTDhEiV6RC9__Rx0Y0n2hSQMyKYj0UGrg&s',
          isDone: false,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: false,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: false,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
    ]),
    GoalLevelsModel(label: 'moderate', goalLevels: [

      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: true,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: true,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: false,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: false,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
    ]),
    GoalLevelsModel(label: 'challenging', goalLevels: [

      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: true,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: true,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: false,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
      GoalLevelThumbNailModel(id: 1,
          video: 0,
          category: 'category',
          thumbnail: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
          isDone: false,
          doneAt: 'doneAt',
          createdAt: 'createdAt'),
    ]),
  ].obs;

  RxBool getGoalLevelsLoading = false.obs;
  RxBool sendSelectedGoalsLoading = false.obs;

  RxList<GDPData> chartData = <GDPData>[
    GDPData('flexibility', 0, Colors.orange),
    GDPData('strength', 0, Colors.red),
    GDPData('balance', 0, Colors.black),
    GDPData('endurance', 0, Colors.purple),
    GDPData('consistency', 0, Colors.green),
    GDPData('mindfulness', 0, Colors.blue)
  ].obs;

  RxBool getChartDataLoading = false.obs;

  RxList<SelectGoalsItemModel> allSelectingGoals = <SelectGoalsItemModel>[].obs;
  RxBool selectGoalsLoading = false.obs;

  //get chart data from api
  Future<void> getChartData() async {
    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AppHelperFunctions.showSnackBar('No Internet Connection');
      return;
    }
    // // Set loading state to true
    getChartDataLoading.value = true;

    // Define the API endpoint URL
    // final String url = ApiUrlConstant.getAllSuggestedExercise;

    // Initialize DioServices for making HTTP requests
    final dioServices = DioServices();
    final String url = ApiUrlConstant.getAllChartData;
    try {
      // Refresh the token if necessary
      await getNewToken();
      // Make a GET request with Bearer token
      final response = await dioServices.getMethodBearer({}, url, token);
      // Check if the response status code is 200 (OK)
      print('response get chart data :${response.data}');

      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseData = response.data;

        // Access the 'data' field from the response
        dynamic jsonResponse = responseData['data'];

        // Convert the JSON data into a list of SuggestedExerciseModel objects
        ChartDataModel chartdatas =
        ChartDataModel.fromJson(jsonResponse as Map<String, dynamic>);
        chartData.clear();



        chartData
            .add(GDPData('balance', chartdatas.balance.toInt(), Colors.black));
        chartData.add(
            GDPData('endurance', chartdatas.endurance.toInt(), Colors.purple));


        chartData.add(GDPData(
            'mindfulness', chartdatas.mindfulness.toInt(), Colors.blue));
        chartData.add(GDPData(
            'flexibility', chartdatas.flexibility.toInt(), Colors.orange));
        chartData.add(GDPData(
            'consistency', chartdatas.consistency.toInt(), Colors.green));
        chartData
            .add(GDPData('strength', chartdatas.strength.toInt(), Colors.red));
        // Assign the fetched data to the observable list
        for (var chart in chartData) {
          print(chart.gdp);
        }
        // Set loading state to false
        getChartDataLoading.value = false;
        print('status code 200');
      } else {
        getChartDataLoading.value = false;
        print('status code :error${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      getChartDataLoading.value = false;
      print('Error: $e');
    }
  }

  void selectGoals(int goalId) {
    final items = allSelectingGoals.where((item) => item.id == goalId);
    for (var item in items) {
      item.isSelected.value = true;
    }
  }

  void unSelectGoals(int goalId) {
    final items = allSelectingGoals.where((item) => item.id == goalId);
    for (var item in items) {
      item.isSelected.value = false;
    }
  }

  String token = '';

  Future<void> getNewToken() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenn = prefs.getString('access_token');
    token = tokenn!;
  }

  Future<void> getAllSelectingGoals() async {
    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AppHelperFunctions.showSnackBar('No Internet Connection');
      return;
    }
    // // Set loading state to true
    selectGoalsLoading.value = true;

    // Define the API endpoint URL
    // final String url = ApiUrlConstant.getAllSuggestedExercise;

    // Initialize DioServices for making HTTP requests
    final dioServices = DioServices();
    final String url = ApiUrlConstant.getAllSelectingGoals;
    try {
      // Refresh the token if necessary
      await getNewToken();
      // Make a GET request with Bearer token
      final response = await dioServices.getMethodBearer({}, url, token);
      // Check if the response status code is 200 (OK)
      print('response SelectingGoals:${response.data}');

      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseData = response.data;

        // Access the 'data' field from the response
        List<dynamic> jsonResponse = responseData['data'];

        // Convert the JSON data into a list of SuggestedExerciseModel objects
        List<SelectGoalsItemModel> selectingGoalsItems = jsonResponse
            .map((goalItem) => SelectGoalsItemModel.fromJson(goalItem))
            .toList();

        // Assign the fetched data to the observable list
        allSelectingGoals.assignAll(selectingGoalsItems);

        // Set loading state to false
        selectGoalsLoading.value = false;
        print('status code 200');
      } else {
        selectGoalsLoading.value = false;
        print('status code :error');
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      selectGoalsLoading.value = false;
      print('Error: $e');
    }
  }

  Future<void> getAllGoalLevels() async {
    // Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AppHelperFunctions.showSnackBar('No Internet Connection');
      return;
    }
    // // Set loading state to true
    getGoalLevelsLoading.value = true;
    print('get goal levels called');

    // Define the API endpoint URL
    // final String url = ApiUrlConstant.getAllSuggestedExercise;

    // Initialize DioServices for making HTTP requests
    final dioServices = DioServices();
    final String url = ApiUrlConstant.getAllGoalLevels;
    try {
      // Refresh the token if necessary
      await getNewToken();
      // Make a GET request with Bearer token
      final response = await dioServices.getMethodBearer({}, url, token);
      // Check if the response status code is 200 (OK)
      print('response get Goals levels :${response.data}');

      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseData = response.data;

        // Access the 'data' field from the response
        List<dynamic> jsonResponse = responseData['data'];

        // Convert the JSON data into a list of SuggestedExerciseModel objects
        List<GoalLevelThumbNailModel> allGoalLevels = jsonResponse
            .map((goalItem) => GoalLevelThumbNailModel.fromJson(goalItem))
            .toList();

        // دسته‌بندی براساس category
        Map<String, List<GoalLevelThumbNailModel>> groupedByCategory = {};

        for (var goal in allGoalLevels) {
          if (!groupedByCategory.containsKey(goal.category)) {
            groupedByCategory[goal.category] = [];
          }
          groupedByCategory[goal.category]!.add(goal);
        }

        // تبدیل دسته‌بندی‌ها به لیست GoalLevelsModel
        List<GoalLevelsModel> goalLevelItems = groupedByCategory.entries
            .map((entry) =>
            GoalLevelsModel(label: entry.key, goalLevels: entry.value))
            .toList();

        // Assign the fetched data to the observable list
        goalLevelsList.assignAll(goalLevelItems);

        // Set loading state to false
        getGoalLevelsLoading.value = false;
        print('status code 200');
      } else {
        getGoalLevelsLoading.value = false;
        print('status code :error');
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      getGoalLevelsLoading.value = false;
      print('Error: $e');
    }
  }

  Future<bool> sendAllSelectedGoals() async {
// Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      AppHelperFunctions.showSnackBar('No Internet Connection');
      return false;
    }
    final dioServices = DioServices();
    final String url = ApiUrlConstant.sendSelectedGoalsInProgressScreen;


    final List<Map<String, dynamic>> map = List.generate(
        allSelectingGoals.length, (index) {
      return {'video': allSelectingGoals[index].videoId};
    });


    try {
      sendSelectedGoalsLoading.value = true;
      // Refresh the token if necessary
      await getNewToken();
      print('map data:$map');
      print('send selected goals called');
      // Make a GET request with Bearer token
      final response = await dioServices.postMethodBearerForBulkCreate(
          map, url, token);
      // Check if the response status code is 200 (OK)
      print('response send selected goals:${response.data}');

      if (response.statusCode == 201) {
        // Parse the JSON response

        sendSelectedGoalsLoading.value = false;

        print('status code 201');
        return true;
      } else {
        // selectGoalsLoading.value = false;
        print('status code :error');
        sendSelectedGoalsLoading.value = false;

        return false;
      }
    } catch (e) {
      sendSelectedGoalsLoading.value = false;

      //
      return false;
    }
    //send all Answers
    //ans
  }

  void showSelectGoalsBottomSheet() {
    getAllSelectingGoals();
    Get.bottomSheet(
      FractionallySizedBox(
        heightFactor: 0.92, // 70% of the screen height
        child: Obx(() {
          if (selectGoalsLoading.value) {
            return LoadingWidget(height: 100, width: 100);
          }
          return DelayedWidget(
            animationDuration: Duration(milliseconds: 1000),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
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
                      SizedBox(
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
                      SizedBox(
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
                      SizedBox(
                        // color: Colors.pink,
                        height: AppDeviceUtils.getScreenheight() * 0.65,
                        child: GridView.builder(
                            physics: allSelectingGoals.length == 8
                                ? NeverScrollableScrollPhysics()
                                : null,
                            itemCount: allSelectingGoals.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent:
                                AppDeviceUtils.getScreenheight() * 0.14,
                                mainAxisSpacing:
                                AppDeviceUtils.getScreenheight() * 0.01,
                                crossAxisSpacing:
                                AppDeviceUtils.getScreenWidth() * 0.04),
                            itemBuilder: (context, index) {
                              final goalItem = allSelectingGoals[index];
                              return GestureDetector(
                                onTap: () {
                                  //select and unselect goal items
                                  if (goalItem.isSelected.value == false) {
                                    selectGoals(goalItem.id);
                                  } else {
                                    unSelectGoals(goalItem.id);
                                  }
                                },
                                child: SelectGoalsGridviewItem(
                                  title: goalItem.title,
                                  imageUrl: goalItem.thumbnail,
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
                                left: 0,
                                right: 0),
                            child: GestureDetector(
                              onTap: () async {
                                final activeButton = allSelectingGoals.any(
                                        (item) =>
                                    item.isSelected.value == true);

                                if (activeButton == true) {
                                  //set goals function
                                  final res = await sendAllSelectedGoals();
                                  if (res) {
                                    Get.back();
                                  } else {
                                    //do nothing
                                    null;
                                  }
                                } else {
                                  //do nothing
                                  null;
                                }
                              },
                              child: Obx(() {
                                final activeButton = allSelectingGoals.any(
                                        (item) =>
                                    item.isSelected.value == true);
                                return Container(
                                  decoration: BoxDecoration(
                                      color: activeButton
                                          ? AppWidgetColor
                                          .selectGoalsScreenActiveButton
                                          : AppWidgetColor
                                          .selectGoalsScreenNotActiveButton,
                                      borderRadius: BorderRadius.circular(15)),
                                  height: 45,
                                  child: Obx(() {
                                    if(sendSelectedGoalsLoading.value){
                                      return Center(child: CircularProgressIndicator(color: Colors.white,),);
                                    }
                                    return Center(
                                        child: Text(
                                          AppTexts.setGoalsButton,
                                          style: AppTextStyle
                                              .SetGoalsButtonTextStyle,
                                        ));
                                  }),
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
          );
        }),
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
    // getAllGoalLevels();
    super.onInit();
  }
}



