import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/utils/device_utility.dart';

class HelperQuestionOptionsWidget extends StatelessWidget {
  final String imageUrl;
  final int id;
  const HelperQuestionOptionsWidget(
      {super.key, required this.id, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDeviceUtils.getScreenheight() * 0.2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(id.toString())],
          ),
          CachedNetworkImage(
            height: AppDeviceUtils.getScreenheight() * 0.2,
            width: double.infinity,
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
