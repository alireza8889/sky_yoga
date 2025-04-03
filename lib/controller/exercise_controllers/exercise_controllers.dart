import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/screens/exercise/models/past_exercise_models.dart';
import 'package:skyyoga/screens/exercise/models/suggested_exercise_model.dart';

import '../../components/api_constant.dart';
import '../../services/dio_services.dart';

class ExerciseScreenController extends GetxController {
  RxBool isAllHelpQuestionAnswered = false.obs;
  RxBool suggestedExerciseLoading = false.obs;

  Future<bool> isVideoIdsSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedVideoIds = prefs.getString('selectedOptionsVideoId');

    if (savedVideoIds != null) {
      isAllHelpQuestionAnswered.value = true;

      return true;
    } else {
      isAllHelpQuestionAnswered.value = false;

      return false;
    }
  }

  List<PastExerciseModel> pastExercises = [];

  RxList<SuggestedExerciseModel> allSuggestedExercise =
      <SuggestedExerciseModel>[].obs;

  // ignore: prefer_typing_uninitialized_variables
  late final token;

  Future<void> getNewToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('access_token');
  }

  Future<void> getAllSuggestedExercise() async {
    suggestedExerciseLoading.value = true;

    final String url = ApiUrlConstant.getAllSuggestedExercise;

    final dioServices = DioServices();

    try {
      await getNewToken();

      final response = await dioServices.getMethodBearer({}, url, token);

      if (response.statusCode == 200) {
        final responseData = response.data;

        List<dynamic> jsonResponse = responseData['data'];

        List<SuggestedExerciseModel> exercises = jsonResponse
            .map((exercise) => SuggestedExerciseModel.fromJson(
                exercise as Map<String, dynamic>))
            .toList();

        allSuggestedExercise.assignAll(exercises);

        suggestedExerciseLoading.value = false;
      } else {
        suggestedExerciseLoading.value = false;
      }
    } catch (e) {
      suggestedExerciseLoading.value = false;
    }
  }

  @override
  void onInit() {
    isVideoIdsSaved().then((value) {
      if (value) {
        getAllSuggestedExercise();
      } else {
        null;
      }
    });

    super.onInit();
  }
}
