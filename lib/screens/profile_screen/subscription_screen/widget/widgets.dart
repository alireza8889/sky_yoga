import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';

class PlanPaymentiWdget extends StatelessWidget {
  const PlanPaymentiWdget({
    super.key,
    required this.size,
    required this.text,
    required this.isOff,
    required this.title,
    this.priceOff = '',
    this.isActive = false,
  });

  final Size size;
  final String title;
  final String text;
  final bool isOff;
  final String priceOff;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.43,
        maxHeight: size.height * 0.1,
      ),
      decoration: BoxDecoration(
        color: isActive
            ? AppWidgetColor.bgSelectedChoose
            : AppWidgetColor.bgOnSelectedChoose,
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color: isActive
              ? AppWidgetColor.borderSelectedChoose
              : AppWidgetColor.borderOnSelectedChoose,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.02,
          right: size.width * 0.02,
        ),
        child: Column(
          spacing: size.height * 0.01,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  title,
                  style: AppTextStyle.titlePlanToContinueTextStyle,
                  minFontSize: 8,
                  overflow: TextOverflow.ellipsis,
                ),
                isOff
                    ? Container(
                        constraints: BoxConstraints(
                          maxWidth: size.width * 0.14,
                          maxHeight: size.height * 0.03,
                        ),
                        decoration: BoxDecoration(
                          color: AppWidgetColor.offSubscriptionColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: AutoSizeText(
                            priceOff,
                            style: AppTextStyle.offPriceTextStyle,
                            minFontSize: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AutoSizeText(
                  "\$$text",
                  style: AppTextStyle.priceTextStyle,
                  minFontSize: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AlarmMessageWidget extends StatelessWidget {
  const AlarmMessageWidget({
    super.key,
    required this.size,
    required this.changeMessage,
  });

  final Size size;
  final int changeMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.07,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: changeMessage == 0
              ? AppWidgetColor.subscriptionBorderColor
              : AppWidgetColor.subscriptionExpireBorderColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            right: size.width * 0.04,
            left: size.width * 0.04,
          ),
          child: Row(
            spacing: size.width * 0.02,
            children: [
              SvgPicture.asset(
                Assets.img.svg.successIcon,
                height: size.height*0.04,
                
              ),
              AutoSizeText(
                changeMessage == 0
                    ? AppString.successMessageSubscription
                    : changeMessage == 1
                        ? AppString.expiredMessageSubscription
                        : AppString.cancleMessageSubscription,
                style: AppTextStyle.titleSubscriptionBottonTextStyle.apply(
                  color: changeMessage == 0
                      ? AppTextColor.titleSubscriptionBottonColor
                      : AppTextColor.titleSubscriptionExpireBottonColor,
                ),
                maxLines: 1,
                minFontSize: 8,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
