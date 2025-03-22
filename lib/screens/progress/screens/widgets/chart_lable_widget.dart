import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/utils/device_utility.dart';

class ChartLabelWidget extends StatelessWidget {
  final String label;
  final Color color;
  const ChartLabelWidget({super.key, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 50,
      width: AppDeviceUtils.getScreenWidth() * 0.3,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(5),
            ),
            height: 20,
            width: 20,
          ),
          Container(
            // color: Colors.purple,
            width: AppDeviceUtils.getScreenWidth()*0.02,
          ),
          AutoSizeText(
            label,
            minFontSize: 6,
            style: AppTextStyle.chartLabelStyle,
          )
        ],
      ),
    );
  }
}
