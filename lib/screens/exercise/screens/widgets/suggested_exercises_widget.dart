
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:skyyoga/screens/exercise/controllers/exercise_controllers.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/suggested_exercize_widget_item.dart';
import 'package:skyyoga/utils/device_utility.dart';
import 'package:get/get.dart';

class SuggestedExercisesWidget extends StatelessWidget {
  final ExerciseScreenController exerciseScreenController;
  final FlutterCarouselController buttonCarouselController =
      FlutterCarouselController();

  SuggestedExercisesWidget({super.key, required this.exerciseScreenController});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Obx(() {
      if (exerciseScreenController.suggestedExerciseLoading.value == true) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      print(exerciseScreenController.allSuggestedExercise.length);
      final List<Widget> suggestedExerciseList = List.generate(
        // exerciseScreenController.allSuggestedExercise.length,
          5,
              (index) =>
              SuggestedExerciseWidgetItem(
                  title: exerciseScreenController.allSuggestedExercise[index]
                      .phase,
                  description: exerciseScreenController
                      .allSuggestedExercise[index].description,
                  imageUrl: exerciseScreenController
                      .allSuggestedExercise[index].sequences[0].thumbnail ??
                      ''));

      // return RotatingCarousel(
      //   panels: suggestedExerciseList,
      //   height: AppDeviceUtils.getScreenheight() * 0.35,
      //   width: AppDeviceUtils.getScreenWidth(),
      //   minRatio: 0.9,
      //   overlapRatio: 0.8,
      // );
      // return  Center(
      //   //Wrap the OverlappedCarousel widget with SizedBox to fix a height. No need to specify width.
      //   child: SizedBox(
      //     height: double.infinity,
      //     child: OverlappedCarousel(
      //       widgets: suggestedExerciseList, //List of widgets
      //       // currentIndex: 2,
      //       onClicked: (index) {
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           SnackBar(
      //             content: Text("You clicked at $index"),
      //           ),
      //         );
      //       },
      //       // To obscure or blur cards not in focus use the obscure parameter.
      //       obscure: 0.1,
      //       // To control skew angle
      //       skewAngle: 0.0,
      //     ),
      //   ),
      // );
      // return RotatingCarousel(
      //   panels: suggestedExerciseList,
      //   height: AppDeviceUtils.getScreenheight() * 0.35,
      //   width:AppDeviceUtils.getScreenWidth()-10,
      //   minRatio: 0.8,
      //   overlapRatio: 0.8,
      // ) ;
      return CarouselSlider(
          items: suggestedExerciseList,
          options: CarouselOptions(
            height: AppDeviceUtils.getScreenheight()*0.34,
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.7,
            enlargeFactor: 0.2,
            initialPage: 2,
          ));
    });
    }
  }

      // return RotatingCarousel(
      //   minRatio: 0.9,
      //   overlapRatio: 0.9,
      //   width: AppDeviceUtils.getScreenWidth() - 70,
      //   height: AppDeviceUtils.getScreenheight() * 0.35,
      //   panels: suggestedExerciseList,
      // );



