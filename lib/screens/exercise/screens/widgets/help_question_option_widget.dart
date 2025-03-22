import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/utils/device_utility.dart';

class HelpQuestionOptionWidget extends StatelessWidget {
  final String imageUrl;
  final int index;
  const HelpQuestionOptionWidget(
      {super.key, required this.imageUrl, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDeviceUtils.getScreenheight()*0.01),
      decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
      height: AppDeviceUtils.getScreenheight() * 0.146,
      width: AppDeviceUtils.getScreenWidth() * 0.48,
      child: Stack(children: [
        CachedNetworkImage(
            placeholder: (context, string) => CircularProgressIndicator(),
            imageUrl: imageUrl),
        Positioned(
          top: 5,
          left: 5,
          child: Text('${index+1}',
          style: TextStyle(color: Colors.blue),
          ),
        )
      ]),
    );
  }
}
