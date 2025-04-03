import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';

class ChooseIndexGender extends StatelessWidget {
  const ChooseIndexGender({
    super.key,
    required this.size,
    required this.text,
    required this.isActive,
  });

  final Size size;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.06,
        maxWidth: size.width * 0.27,
      ),
      decoration: BoxDecoration(
        color: isActive
            ? AppWidgetColor.bgSelectedChoose
            : AppWidgetColor.bgOnSelectedChoose,
        border: Border.all(
            color: isActive
                ? AppWidgetColor.borderSelectedChoose
                : AppWidgetColor.borderOnSelectedChoose),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          text,
          style: AppTextStyle.onboardingChooseIndexTextStyle
              .apply(fontWeightDelta: isActive ? 2 : 1),
        ),
      ),
    );
  }
}
