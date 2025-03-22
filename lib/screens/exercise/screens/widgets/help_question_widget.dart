import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/screens/exercise/screens/widgets/help_question_option_widget.dart';
import 'package:skyyoga/utils/device_utility.dart';

import '../../models/help_question_option_model.dart';

class HelpQuestionWidget extends StatelessWidget {
  final String question;
  final List<HelpQuestionOptionModel> options;
  const HelpQuestionWidget({
    super.key,
    required this.question,
    required this.options,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Container(
              // color: Colors.orange,
              height: AppDeviceUtils.getScreenheight() * 0.07,
              width: double.infinity,
              // padding: EdgeInsets.symmetric(horizontal: 8.0),
              // color: Colors.green,
              child: AutoSizeText(
                minFontSize: 12,
                maxLines: 2,
                question,
                style: AppTextStyle.helperQuestion,
              ),
            ),
          ),
          Container(
            // color: Colors.blue,
            height: AppDeviceUtils.getScreenheight() * 0.02,
          ),
          SizedBox(
            // color: Colors.yellow,
            width: AppDeviceUtils.getScreenWidth()*0.8,
            height: AppDeviceUtils.getScreenheight() * 0.64,
            child: ListView.builder(
                itemCount: options.length,
                itemBuilder: (context, index) {
                  return HelpQuestionOptionWidget(imageUrl: '', index: index);
                }),
          ),
        ],
      ),
    );
  }
}
