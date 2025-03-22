import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:skyyoga/screens/exercise/controllers/exercise_controllers.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/suggested_exercize_widget_item.dart';
import 'package:skyyoga/utils/device_utility.dart';
import 'package:rotating_carousel/rotating_carousel.dart';


class SuggestedExercisesWidget extends StatelessWidget {
  final ExerciseScreenController exerciseScreenController;
  final FlutterCarouselController buttonCarouselController =
      FlutterCarouselController();

  SuggestedExercisesWidget({super.key, required this.exerciseScreenController});
ScrollController scrollController=ScrollController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> suggestedExerciseList = List.generate(
        exerciseScreenController.allSuggestedExercise.length,
        (index) => SuggestedExerciseWidgetItem(
            title: exerciseScreenController.allSuggestedExercise[index].title,
            description: exerciseScreenController
                .allSuggestedExercise[index].description,
            imageUrl:
                exerciseScreenController.allSuggestedExercise[index].imageUrl));



  return RotatingCarousel(
    panels: suggestedExerciseList,
    height: AppDeviceUtils.getScreenheight() * 0.35,
    width:AppDeviceUtils.getScreenWidth(),
    minRatio: 0.9,
    overlapRatio: 0.8,
  ) ;

  }
}
