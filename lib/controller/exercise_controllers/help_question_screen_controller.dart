// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:skyyoga/components/api_constant.dart';
// import 'package:skyyoga/screens/exercise/models/help_question_model.dart';
// import 'package:skyyoga/screens/exercise/models/help_question_option_model.dart';
// import 'package:skyyoga/services/dio_services.dart';
//
// class HelpQuestionScreenController extends GetxController {
//   RxList<HelpQuestionModel> helpQuestionList = <HelpQuestionModel>[].obs;
//   RxBool sendingAnswersLoading = false.obs;
//   RxList<String> selectedOptionsVideoId = <String>[].obs;
//
//   RxBool helpQuestionScreenIsLoading = false.obs;
//
//   RxInt currentIndexForPageView = 0.obs;
//   PageController pageController = PageController();
//
//   bool isAllHelpQuestionAnswered = false;
//
//   // ignore: prefer_typing_uninitialized_variables
//   late final token;
//
//   Future<void> getNewToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     token = prefs.getString('access_token');
//   }
//
//   Future<void> saveSelectedOptionsVideoId() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     final List<String> videoIds = selectedOptionsVideoId.toList();
//
//     final String jsonString = videoIds.toString();
//
//     await prefs.setString('selectedOptionsVideoId', jsonString);
//   }
//
//   Future<List<Map<String, String>>> getSavedVideoIds() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     final String? jsonString = prefs.getString('selectedOptionsVideoId');
//
//     if (jsonString != null) {
//       final List<String> videoIds = List<String>.from(jsonString
//           .replaceAll('[', '')
//           .replaceAll(']', '')
//           .split(',')
//           .map((e) => e.trim())
//           .toList());
//
//       final List<Map<String, String>> formattedVideoIds =
//           videoIds.map((videoId) {
//         return {"video_id": videoId};
//       }).toList();
//
//       return formattedVideoIds;
//     } else {
//       return [];
//     }
//   }
//
//   Future<void> getAllHelpQuestion() async {
//     helpQuestionScreenIsLoading.value = true;
//     final String url = ApiUrlConstant.getAllHelpQuestion;
//     final dioServices = DioServices();
//
//     try {
//       await getNewToken();
//       final response = await dioServices.getMethodBearer({}, url, token);
//
//       if (response.statusCode == 200) {
//         final responseData = response.data;
//         final List<dynamic> data = responseData['data'];
//
//         final List<HelpQuestionOptionModel> allOptions = data
//             .map((helpQuestionData) =>
//                 HelpQuestionOptionModel.fromJson(helpQuestionData))
//             .toList();
//         for (int i = 0; i < allOptions.length; i += 4) {
//           final end = (i + 4 < allOptions.length) ? i + 4 : allOptions.length;
//           final group = allOptions.sublist(i, end);
//
//           helpQuestionList.add(HelpQuestionModel(options: group));
//         }
//
//         helpQuestionScreenIsLoading.value = false;
//       } else {
//         helpQuestionScreenIsLoading.value = false;
//       }
//     } catch (e) {
//       helpQuestionScreenIsLoading.value = false;
//     }
//   }
//
//   Future<dynamic> sendHelpQuestionAnswersVideoId({
//     required String videoId,
//   }) async {
//     final String url = ApiUrlConstant.sendHelpQuestionAnswersVideoId;
//     final dioServices = DioServices();
//
//     try {
//       await getNewToken();
//
//       final Map<String, dynamic> videoIdMap = {
//         "video_id": videoId,
//       };
//
//       final response = await dioServices.postMethodBearer(
//         videoIdMap,
//         url,
//         token,
//       );
//
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   Future<bool> sendAllVideoIds() async {
//     List<int> res = [];
//
//     final List<Map<String, String>> videoIds = await getSavedVideoIds();
//     sendingAnswersLoading.value = true;
//
//     for (final videoIdMap in videoIds) {
//       final String videoId = videoIdMap['video_id']!;
//       try {
//         final response = await sendHelpQuestionAnswersVideoId(
//           videoId: videoId,
//         );
//
//         if (response.statusCode == 200) {
//           res.add(1);
//         } else {
//           res.add(0);
//         }
//       } catch (e) {
//         res.add(0);
//       }
//     }
//
//     if (res.any((element) => element == 0)) {
//       sendingAnswersLoading.value == false;
//
//       return false;
//     } else {
//       await saveSelectedOptionsVideoId();
//       sendingAnswersLoading.value == false;
//
//       return true;
//     }
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     getAllHelpQuestion();
//   }
// }
