import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/utils/device_utility.dart';

class HelpQuestionOptionWidget extends StatelessWidget {
  final String thumbnail;
  final String videoId;
  final int index;
  RxBool isSelected;
  HelpQuestionOptionWidget(
      {super.key,
      required this.thumbnail,
      required this.index,
      required this.videoId,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDeviceUtils.getScreenheight() * 0.01),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      height: AppDeviceUtils.getScreenheight() * 0.146,
      width: AppDeviceUtils.getScreenWidth() * 0.48,
      child: Stack(children: [
        CachedNetworkImage(
            placeholder: (context, string) => CircularProgressIndicator(),
            imageUrl: thumbnail),
        Positioned(
          top: 5,
          left: 5,
          child: Text(
            '${index + 1}',
            style: TextStyle(color: Colors.blue),
          ),
        ),
        Obx(() {
          if (isSelected.value == true) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.withOpacity(0.2),
              ),
            );
          } else {
            return SizedBox();
          }
        })
      ]),
    );
  }
}
