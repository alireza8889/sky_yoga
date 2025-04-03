import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/screens/exercise/models/past_exercise_models.dart';
import 'package:skyyoga/screens/exercise/models/suggested_exercise_model.dart';

import '../../../components/api_constant.dart';
import '../../../services/dio_services.dart';



class ExerciseScreenController extends GetxController {
  RxBool isAllHelpQuestionAnswered = false.obs;
  RxBool suggestedExerciseLoading = false.obs;
  RxBool pastExerciseLoading = false.obs;
//video ids hase been saved in help question controller
  Future<bool> isVideoIdsSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedVideoIds = prefs.getString('selectedOptionsVideoId');

    if (savedVideoIds != null) {
      isAllHelpQuestionAnswered.value = true;
      print('answered');

      return true;
    } else {
      print('nothing answerd');
      isAllHelpQuestionAnswered.value = false;

      return false;
    }
  }

  RxList<PastExerciseModel> pastExercises =<PastExerciseModel> [
    PastExerciseModel(isLiked: false.obs,
        thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpOoTDhEiV6RC9__Rx0Y0n2hSQMyKYj0UGrg&s',
        title: 'title1', id: 1, videoSequence: 10, sequenceLength: 10, duration: 15, description: 'description1', watchedNumber: 5, isComplete: true),
    PastExerciseModel(isLiked: false.obs,
        thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpOoTDhEiV6RC9__Rx0Y0n2hSQMyKYj0UGrg&s',
        title: 'title1', id: 2, videoSequence: 10, sequenceLength: 10, duration: 15, description: 'description1', watchedNumber: 5, isComplete: true),
    PastExerciseModel(isLiked: false.obs,
        thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
        title: 'title1', id: 3, videoSequence: 10, sequenceLength: 10, duration: 15, description: 'description1', watchedNumber: 5, isComplete: true),
    PastExerciseModel(isLiked: false.obs,
        thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNXjMwl_VFgjn-Bz6aNulOJD61AFQ6-6DwKw&s',
        title: 'title1', id: 4, videoSequence: 10, sequenceLength: 10, duration: 15, description: 'description1', watchedNumber: 5, isComplete: true),
  ].obs;

  RxList<SuggestedExerciseModel> allSuggestedExercise =
      <SuggestedExerciseModel>[
    SuggestedExerciseModel(
        id: 1,
        phase: 'Core & liwer back strenght1',
        description: 'Consectetur adipiscing elitKorem ipsum dolor sit amet,',
        sequenceLength: 0,
        sequences: [],
        duration:10.0,
        props: Props(
            propsWall: true,
            propsBlanket: false,
            propsBolster: false,
            propsBelt: false,
            propsBlocks: false)),
        SuggestedExerciseModel(
        id: 2,
        phase: 'Core & liwer back strenght2',
        description: 'neededconsectetur adipiscing elitKorem ipsum dolor sit amet,',
        sequenceLength: 0,
        sequences: [],
        duration: 0.0,
        props: Props(
            propsWall: true,
            propsBlanket: false,
            propsBolster: false,
            propsBelt: true,
            propsBlocks: false)),
        SuggestedExerciseModel(
        id: 3,
        phase: 'Core & liwer back strenght3',
        description: 'neededconsectetur adipiscing elitKorem ipsum dolor sit amet,',
        sequenceLength: 0,
        sequences: [],
        duration: 16.0,
        props: Props(
            propsWall: true,
            propsBlanket: false,
            propsBolster: false,
            propsBelt: true,
            propsBlocks: false)),
        SuggestedExerciseModel(
        id: 4,
        phase: 'Core & liwer back strenght4',
        description: ' neededconsectetur adipiscing elitKorem ipsum dolor sit amet,',
        sequenceLength: 0,
        sequences: [],
        duration: 14.0,
        props: Props(
            propsWall: true,
            propsBlanket: false,
            propsBolster: false,
            propsBelt: true,
            propsBlocks: false)),
        SuggestedExerciseModel(
        id: 5,
        phase: 'Core & liwer back strenght5',
        description: 'neededconsectetur adipiscing elitKorem ipsum dolor sit amet,',
        sequenceLength: 0,
        sequences: [],
        duration: 0.0,
        props: Props(
            propsWall: false,
            propsBlanket: false,
            propsBolster: false,
            propsBelt: false,
            propsBlocks: false)),
        SuggestedExerciseModel(
        id: 6,
        phase: 'Core & liwer back strenght6',
        description: 'neededconsectetur adipiscing elitKorem ipsum dolor sit amet,',
        sequenceLength: 0,
        sequences: [],
        duration: 0.0,
        props: Props(
            propsWall: true,
            propsBlanket: false,
            propsBolster: false,
            propsBelt: true,
            propsBlocks: false)),

  ].obs;
  //get new token
  String token = '';

  Future<void> getNewToken() async {
    final prefs = await SharedPreferences.getInstance();
    final tokenn = prefs.getString('access_token');
    token = tokenn!;
  }

  Future<void> getAllSuggestedExercise() async {
    // // Set loading state to true
    suggestedExerciseLoading.value = true;

    // Define the API endpoint URL
    final String url = ApiUrlConstant.getAllSuggestedExercise;

    // Initialize DioServices for making HTTP requests
    final dioServices = DioServices();
    print('get suggested called');

    try {
      // Refresh the token if necessary
      await getNewToken();
      // Make a GET request with Bearer token
      final response = await dioServices.getMethodBearer({}, url, token);
      // Check if the response status code is 200 (OK)
      print('response date suggested:${response.data}');

      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseData = response.data;

        // Access the 'data' field from the response
        List<dynamic> jsonResponse = responseData['data'];

        // Convert the JSON data into a list of SuggestedExerciseModel objects
        List<SuggestedExerciseModel> exercises = jsonResponse
            .map((exercise) => SuggestedExerciseModel.fromJson(
                exercise as Map<String, dynamic>))
            .toList();

        // Assign the fetched data to the observable list
        allSuggestedExercise.assignAll(exercises);

        // Set loading state to false
        suggestedExerciseLoading.value = false;
        print('status code:200');
      } else {
        // Handle non-200 status codes
        suggestedExerciseLoading.value = false;
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      suggestedExerciseLoading.value = false;
      print('Error: $e');
    }
  }




// save and get liked past exercise
  Future<void> addIdToList(dynamic newId) async {
    final key = 'liked_past_exercises';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);

    List<dynamic> idList = [];
    if (jsonString != null) {
      idList = jsonDecode(jsonString);
    }

    idList.add(newId);

    String updatedJsonString = jsonEncode(idList);
    prefs.setString(key, updatedJsonString);
    print('past exercise id added:$newId');
  }
  Future<void> removeIdFromList(dynamic idToRemove) async {
    final key = 'liked_past_exercises';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);

    if (jsonString != null) {
      List<dynamic> idList = jsonDecode(jsonString);

      // حذف شناسه مورد نظر از لیست
      idList.remove(idToRemove);

      String updatedJsonString = jsonEncode(idList);
      prefs.setString(key, updatedJsonString);
      print('past exercise id removed:$idToRemove');
    }
  }
  Future<List<int>> getLikedPastExercises() async {
    final key = 'liked_past_exercises';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(key);

    if (jsonString != null) {
      try {
        List<dynamic> decodedList = jsonDecode(jsonString);
        // Ensure all elements are integers and return them as a List<int>
        return decodedList.whereType<int>().toList();
      } catch (e) {
        // Handle JSON decoding errors
        print('Error decoding JSON: $e');
        return []; // Return empty list in case of error
      }
    } else {
      return []; // Return empty list if no data is found
    }
  }



  Future<void> getAllPastExercise() async {
    // // Set loading state to true
    pastExerciseLoading.value = true;

    // Define the API endpoint URL
    // final String url = ApiUrlConstant.getAllSuggestedExercise;

    // Initialize DioServices for making HTTP requests
    final dioServices = DioServices();
    final String url = ApiUrlConstant.getAllPastExercises;
    try {
      // Refresh the token if necessary
      await getNewToken();
      // Make a GET request with Bearer token
      final response = await dioServices.getMethodBearer({}, url, token);
      // Check if the response status code is 200 (OK)
      print('response past Exercise:${response.data}');

      if (response.statusCode == 200) {
        // Parse the JSON response
        final responseData = response.data;

        // Access the 'data' field from the response
        List<dynamic> jsonResponse = responseData['data'];

        // Convert the JSON data into a list of SuggestedExerciseModel objects
        List<PastExerciseModel> pastExercisess = jsonResponse
            .map((pastExercise) => PastExerciseModel.fromJson(pastExercise))
            .toList();

        // Update isLiked based on stored liked IDs
        List<int> likedIds = await getLikedPastExercises();
        print(likedIds);
//update isLiked with saved ids in local sharedPrefernce
        for (var exercise in pastExercisess) {
          if (likedIds.contains(exercise.id)) {
            exercise.isLiked.value = true;
          } else {
            exercise.isLiked.value = false;
          }
        }

        print(pastExercisess.length);
        pastExercisess.sort((a,b)=>a.id.compareTo(b.id));
        // Assign the fetched data to the observable list
        pastExercises.assignAll(pastExercisess);

        // Set loading state to false
        pastExerciseLoading.value = false;
        print('status code 200');
      } else {
        pastExerciseLoading.value = false;
        print('status code :error');
      }
    } catch (e) {
      // Handle any exceptions that occur during the process
      pastExerciseLoading.value = false;
      print('Error: $e');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    isVideoIdsSaved().then((value) {
      if (!value) {
        getAllSuggestedExercise();
      } else {
        null;
      }
    });

    getAllPastExercise();

    super.onInit();
  }
}
