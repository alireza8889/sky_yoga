
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/api_constant.dart';
import 'package:skyyoga/screens/exercise/models/help_question_model.dart';
import 'package:skyyoga/screens/exercise/models/help_question_option_model.dart';
import 'package:skyyoga/services/dio_services.dart';



class HelpQuestionScreenController extends GetxController {
  RxList<HelpQuestionModel> helpQuestionList = <HelpQuestionModel>[].obs;
  RxBool sendingAnswersLoading = false.obs;
  RxList<String> selectedOptionsVideoId = <String>[].obs;

  RxBool helpQuestionScreenIsLoading = false.obs;
  RxBool sendHelpQuestionAnswersLoading = false.obs;

  RxInt currentIndexForPageView = 0.obs;
  PageController pageController = PageController();

  String token = '';

  bool isAllHelpQuestionAnswered = false;

  //get new token
  Future<void> getNewToken() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenn = prefs.getString('access_token');
    token = tokenn!;
  }

// Save RxList<String> to SharedPreferences
  Future<void> saveSelectedOptionsVideoId() async {
    final prefs = await SharedPreferences.getInstance();

    // Convert RxList<String> to List<String>
    final List<String> videoIds = selectedOptionsVideoId.toList();

    // Convert List<String> to JSON string
    final String jsonString = videoIds.toString();

    // Save JSON string to SharedPreferences
    await prefs.setString('selectedOptionsVideoId', jsonString);
    print('saved to local sharedPreference');
  }

  //get saved video_ids from shared preference
  Future<List<Map<String, String>>> getSavedVideoIds() async {
    final prefs = await SharedPreferences.getInstance();

    // Retrieve JSON string from SharedPreferences
    final String? jsonString = prefs.getString('selectedOptionsVideoId');

    if (jsonString != null) {
      // Convert JSON string to List<String>
      final List<String> videoIds = List<String>.from(jsonString
          .replaceAll('[', '')
          .replaceAll(']', '')
          .split(',')
          .map((e) => e.trim()) // Trim any extra spaces
          .toList());

      // Format the video IDs into the desired structure
      final List<Map<String, String>> formattedVideoIds =
          videoIds.map((videoId) {
        return {"video_id": videoId};
      }).toList();

      // Return the formatted list
      return formattedVideoIds;
    } else {
      print('No video IDs found in SharedPreferences');
      return []; // Return an empty list if no video IDs are found
    }
  }

  //get help questions
  Future<void> getAllHelpQuestion() async {
    // Check Internet Connectivity
    // final isConnected = await NetworkManager.instance.isConnected();
    // if (!isConnected) {
    //   AppHelperFunctions.showSnackBar('No Internet Connection');
    //   return ;
    // }
    print('help Question called');
    helpQuestionScreenIsLoading.value = true;
    final String url = ApiUrlConstant.getAllHelpQuestion;
    final dioServices = DioServices();

    try {
      await getNewToken();
      final response = await dioServices.getMethodBearer({}, url, token);
      print(response.data);

      if (response.statusCode == 200) {
        final responseData = response.data;
        final List<dynamic> data = responseData['data'];

        // تبدیل داده‌ها به لیست HelpQuestionOptionModel
        final List<HelpQuestionOptionModel> allOptions = data
            .map((helpQuestionData) =>
                HelpQuestionOptionModel.fromJson(helpQuestionData))
            .toList();
        for (int i = 0; i < allOptions.length; i += 4) {
          // اطمینان از اینکه index خارج از محدوده نباشد
          final end = (i + 4 < allOptions.length) ? i + 4 : allOptions.length;
          final group = allOptions.sublist(i, end);

          // ایجاد HelpQuestionModel و اضافه کردن به لیست
          helpQuestionList.add(HelpQuestionModel(options: group));
        }
        print(helpQuestionList.map(
            (element) => (element.options.map((ele) => print(ele.videoId)))));

        print('get help question Data: $data');
        helpQuestionScreenIsLoading.value = false;
      } else {
        helpQuestionScreenIsLoading.value = false;
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      helpQuestionScreenIsLoading.value = false;
      print('Error: $e');
    }
  }

  //send help questions videoId
  Future<bool> sendAllHelpQuestionAnswersVideoId() async {
    final String url = ApiUrlConstant.sendAllHelpQuestionAnswersVideoIds;
    final dioServices = DioServices();
    sendHelpQuestionAnswersLoading.value=true;
    try {
      await getNewToken();

      await saveSelectedOptionsVideoId();
      final List<Map<String, dynamic>> videoIds = await getSavedVideoIds();
      // Create a map with the single video ID

      // Send the video ID in the request body
      final response = await dioServices.postMethodBearerForBulkCreate(
        videoIds, // Request body with a single video ID
        url,
        token,
      );
      print('response for send help questions answer:${response.data}');
      if(response.statusCode==201) {
        // Return the response object
        print('statusCode for send help questions answer');
      }
      print('All video ids for help question sent successfully');

      return true;
    } catch (e) {
      print('Error: Exception occurred while sending video ID : $e');
      rethrow; // Rethrow the exception to handle it in the calling method
    }
  }



  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit

    getAllHelpQuestion();
  }
}
