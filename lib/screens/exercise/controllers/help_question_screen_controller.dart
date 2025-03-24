import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/api_constant.dart';
import 'package:skyyoga/screens/exercise/models/help_question_model.dart';
import 'package:skyyoga/screens/exercise/models/help_question_option_model.dart';
import 'package:skyyoga/services/dio_services.dart';

class HelpQuestionScreenController extends GetxController {
  RxList<HelpQuestionModel> helpQuestionList = <HelpQuestionModel>[].obs;

  RxList<String> selectedOptionsVideoId = <String>[].obs;

  RxInt currentIndexForPageView = 1.obs;
  PageController pageController = PageController();

  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzQyNzI4NTE3LCJpYXQiOjE3NDI3Mjc2NzcsImp0aSI6IjE2NTNlMzkwNDExYjQ0ZTFiYTY5NGQ2NjQzN2YyZmVhIiwidXNlcl9pZCI6MTJ9.vWctDohlWeLTUZmgfWXH7RCm76LQfLj2yRj-XpII3h4";

  //get new token
  String getNewToken() {
return token;
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
      final List<Map<String, String>> formattedVideoIds = videoIds.map((videoId) {
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
  Future<void> getAllHelpQuestion({required String token}) async {
    final String url = ApiUrlConstant.getAllHelpQuestion;
    final dioServices = DioServices();

    try {
      final response = await dioServices.getMethodBearer({}, url, token);

      if (response.statusCode == 200) {
        // print(response.data);
        // Parse the JSON response
        final responseData = response.data;

        // // Access the data
        final List<dynamic> data = responseData['data'];
        final List<HelpQuestionOptionModel> helpQuestionOptions =
            (responseData['data'] as List)
                .map((helpQuestionData) =>
                    HelpQuestionOptionModel.fromJson(helpQuestionData))
                .toList();
        final helpQuestionItem =
            HelpQuestionModel(options: helpQuestionOptions);
        helpQuestionList.add(helpQuestionItem);
        //قراره جنتا helpQuestionItem به لیست اضافه بشه با استفاده از حلقه for که در نهایت pageview چند صفحه داشته باشه

        // final String error = responseData['error'];
        // final String message = responseData['message'];
        // final Map<String, dynamic> pagination = responseData['pagination'];

        // Print or use the data as needed
        print('Data: $data');
        // print('Error: $error');
        // print('Message: $message');
        // print('Pagination: $pagination');
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Errror: $e');
    }
  }



  //send help questions videoId
  Future<Response> sendHelpQuestionAnswersVideoId({
    required String videoId,

  }) async {
    final String url = ApiUrlConstant.sendHelpQuestionAnswersVideoId;
    final dioServices = DioServices();

    try {
      // Create a map with the single video ID
      final Map<String, dynamic> videoIdMap = {
        "video_id": videoId,
      };

      // Send the video ID in the request body
      final response = await dioServices.postMethodBearer(
        videoIdMap, // Request body with a single video ID
        url,
        token,
      );

      // Return the response object
      return response;
    } catch (e) {
      print('Error: Exception occurred while sending video ID $videoId: $e');
      rethrow; // Rethrow the exception to handle it in the calling method
    }
  }


//send all video id
  Future<bool> sendAllVideoIds() async {
    List<int> res=[];
    // Retrieve the list of video IDs
    await saveSelectedOptionsVideoId();
    final List<Map<String, String>> videoIds = await getSavedVideoIds();

    // Iterate over the list and send each video ID
    for (final videoIdMap in videoIds) {
      final String videoId = videoIdMap['video_id']!;

      try {
        // Send the video ID and wait for the response
        final response = await sendHelpQuestionAnswersVideoId(videoId: videoId, );

        // Check the status code of the response
        if (response.statusCode == 200) {
          print('Success: Video ID $videoId was sent successfully.');
          res.add(1);
        } else {
          res.add(0);
          print('Error: Failed to send video ID $videoId. Status code: ${response.statusCode}');
        }
      } catch (e) {
        res.add(0);
        print('Error: Exception occurred while sending video ID $videoId: $e');
      }
    }
    //if all videoIds send successfully
    if(res.any((element)=>element==0)){
      return false;
    }else{
      return true;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // TODO: implement onInit
    getAllHelpQuestion(token: token);
  }
}
