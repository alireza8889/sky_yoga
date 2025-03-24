import 'package:get/get.dart';

class SelectMoodController extends GetxController{
  RxString selectedMood = ''.obs;

  List<String> moods = [
    'At peace',
    'Clear-minded',
    'Expressive',
    'Harmonious',
    'Empowered',
    'Joyful',
    'Grounded',
  ];
}