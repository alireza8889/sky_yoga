import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';

class MultiBoxSelected extends StatelessWidget {
  const MultiBoxSelected({
    super.key,
    required this.size,
    required this.selectedItem,
    required this.filings,
    required this.i,
  });

  final Size size;
  final List<String> selectedItem;
  final Map<String, String> filings;
  final String i;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.02,
      ),
      constraints: BoxConstraints(
        minHeight: size.height * 0.053,
      ),
      decoration: BoxDecoration(
        color: selectedItem.contains(i)
            ? AppWidgetColor.bgSelectedChoose
            : AppWidgetColor.bgOnSelectedChoose,
        border: Border.all(
            color: selectedItem.contains(i)
                ? AppWidgetColor.borderSelectedChoose
                : AppWidgetColor.borderOnSelectedChoose),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.85,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    bottom: size.height * 0.01,
                  ),
                  child: AutoSizeText(
                    filings[i].toString(),
                    minFontSize: 8,
                    maxLines: 2,
                    style: AppTextStyle.onboardingChooseIndexTextStyle.apply(
                        fontWeightDelta: selectedItem.contains(i) ? 2 : 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SoloBoxSelected extends StatelessWidget {
  const SoloBoxSelected({
    super.key,
    required this.size,
    required this.selectedItem,
    required this.filings,
    required this.index,
    required this.text,
    required this.isActive,
  });

  final Size size;
  final List<String> selectedItem;
  final List<String> filings;
  final int index;
  final String text;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: size.height * 0.053,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.85,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.01,
                    left: size.width * 0.05,
                    right: size.width * 0.05,
                    bottom: size.height * 0.01,
                  ),
                  child: AutoSizeText(text,
                      minFontSize: 8,
                      maxLines: 2,
                      style: AppTextStyle.onboardingChooseIndexTextStyle
                          .apply(fontWeightDelta: isActive ? 2 : 1)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
