import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/suggested_exercize_widget_item.dart';
import 'package:skyyoga/utils/device_utility.dart';
import 'package:get/get.dart';
import 'package:skyyoga/widget/loading_widget.dart';

import '../../controllers/exercise_controllers.dart';

// ignore: must_be_immutable
class SuggestedExercisesWidget extends StatelessWidget {
  final ExerciseScreenController exerciseScreenController;

  SuggestedExercisesWidget({super.key, required this.exerciseScreenController});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (exerciseScreenController.suggestedExerciseLoading.value == true) {
        return Center(
          child: LoadingWidget(height: double.infinity, width: double.infinity),
        );
      }
      // return CarouselSlider.builder(
      //   itemCount: 10,
      //   options: CarouselOptions(
      //     viewportFraction: 0.6,
      //     initialPage: 0,
      //     enableInfiniteScroll: true,
      //     enlargeCenterPage: true,
      //     enlargeFactor: 0.2,
      //     onPageChanged: (int index, CarouselPageChangedReason reason) {},
      //     scrollDirection: Axis.horizontal,
      //     enlargeStrategy: CenterPageEnlargeStrategy.scale,
      //   ),
      //   itemBuilder: (BuildContext context, int index, int realIndex) {
      //     // final DeckCardModel model =suggestedList[index];
      //     return InkWell(
      //       onTap: () {
      //
      //       },
      //       child: SizedBox(
      //         height: AppDeviceUtils.getScreenheight()*0.33,
      //         width: Get.width / 0.15,
      //         child: ClipRRect(
      //           borderRadius: const BorderRadius.all(
      //             Radius.circular(10.0),
      //           ),
      //           child: suggestedList[index]
      //         ),
      //       ),
      //     );
      //   },
      // );

      // return  Container(
      //   height: 100,
      //   width: 200,
      //   child: CardSwiper(
      //     threshold: 20,
      //     scale: 0.8,
      //     numberOfCardsDisplayed: 3,
      //     backCardOffset: Offset(-10, -30),
      //     allowedSwipeDirection: AllowedSwipeDirection.only(left: true,right: true),
      //      cardsCount:exerciseScreenController.allSuggestedExercise.length,
      //      cardBuilder: (context, index, percentThresholdX, percentThresholdY) => suggestedList[index],
      //    ),
      // );
      //  return CarouselSlider(
      //      items: suggestedList,
      //      options: CarouselOptions(
      //        height: AppDeviceUtils.getScreenheight() * 0.34,
      //        autoPlay: false,
      //        enlargeCenterPage: true,
      //        viewportFraction: 0.6,
      //          enlargeFactor: 0.3, // میزان بزرگنمایی آیتم وسط
      //        initialPage: 2,
      //        padEnds: true
      //      ));
      return Swiper(
        outer: true,
        indicatorLayout: PageIndicatorLayout.COLOR,
        layout: SwiperLayout.CUSTOM,
        containerHeight: AppDeviceUtils.getScreenheight() * 0.5,
        customLayoutOption: CustomLayoutOption(startIndex: 1, stateCount: 3)
          ..addTranslate([
            Offset(-AppDeviceUtils.getScreenWidth() * 0.1, 0.0),
            Offset(AppDeviceUtils.getScreenWidth() * 0.1, 0.0),
            Offset(0.0, 0.0),
          ])
          ..addScale([
            0.9,
            0.9,
            1.0,
          ], Alignment.topLeft),
        itemWidth: AppDeviceUtils.getScreenheight() * 0.25,
        itemHeight: AppDeviceUtils.getScreenheight() * 0.35,
        itemBuilder: (context, index) {
          final exercise = exerciseScreenController.allSuggestedExercise[index];

          final durationString = exercise.duration.toString();

          final String propsString = (() {
            final props = exercise.props;
            final List<String> activeProps = [];

            if (props.propsWall) activeProps.add('Wall');
            if (props.propsBlanket) activeProps.add('Blanket');
            if (props.propsBolster) activeProps.add('Bolster');
            if (props.propsBelt) activeProps.add('Belt');
            if (props.propsBlocks) activeProps.add('Blocks');

            return activeProps.isNotEmpty ? activeProps.join(', ') : 'No Props';
          })();
          return SuggestedExerciseWidgetItem(
            title: exercise.phase,
            description: exercise.description,
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFWDGa0rLwLIah7KAH_2eH2zosEvm9ZXGT9Q&s',
            props: propsString,
            duration: durationString,
          );
        },
        itemCount: exerciseScreenController.allSuggestedExercise.length,
        pagination: null,
        controller: null,
        control: null,
      );
    });
  }
}
