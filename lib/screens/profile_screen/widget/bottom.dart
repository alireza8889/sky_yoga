import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class BottonProfileHorizontal extends StatelessWidget {
  const BottonProfileHorizontal({
    super.key,
    required this.size,
    required this.text1,
    required this.text2,
    required this.icon1,
    required this.icon2,
    required this.page,
  });

  final Size size;
  final String text1;
  final String text2;
  final Widget icon1;
  final Widget icon2;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatePushWithFadeTransition(context, page);
      },
      child: Container(
        constraints: BoxConstraints(
          maxHeight: size.height * 0.07,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppWidgetColor.borderColor,
            ),
            borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.04,
              left: size.width * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: size.width * 0.02,
                  children: [
                    icon1,
                    Text(
                      text1,
                      style: AppTextStyle.titleProfileBottonVerticlaTextStyle
                          .apply(fontSizeFactor: 1.05),
                    ),
                  ],
                ),
                Row(
                  spacing: size.width * 0.04,
                  children: [
                    Text(
                      text2,
                      style: AppTextStyle.titleProfileBottonHorizontalTextStyle
                          .apply(fontSizeFactor: 1.05),
                    ),
                    icon2,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TitleBottonProfileVertical extends StatelessWidget {
  const TitleBottonProfileVertical({
    super.key,
    required this.size,
    required this.text,
    required this.svgPic,
  });

  final Size size;
  final String text;
  final Widget svgPic;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.28,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppWidgetColor.borderColor,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.02,
          left: size.width * 0.04,
          bottom: size.height * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [svgPic],
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.23,
                  child: AutoSizeText(
                    text,
                    style: AppTextStyle.titleProfileBottonVerticlaTextStyle,
                    minFontSize: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutBotton extends StatelessWidget {
  const LogoutBotton({
    super.key,
    required this.controller,
    required this.size,
  });

  final LoginController controller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      position: PopupMenuPosition.under,
      icon: SvgPicture.asset(Assets.img.svg.more),
      onSelected: (value) {
        if (value == 'Logout') {
          controller.logout(context);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'Logout',
            height: size.height * 0.028,
            child: ClipRRect(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.3,
                  maxHeight: size.height * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Row(
                        spacing: size.width * 0.02,
                        children: [
                          Icon(
                            Iconsax.logout,
                            color: AppTextColor.logoutProfileColor,
                          ),
                          Text(
                            AppString.logoutProfile,
                            style: AppTextStyle.moreBottomTextStyle,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}

class DeleteBotton extends StatelessWidget {
  const DeleteBotton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      position: PopupMenuPosition.under,
      icon: SvgPicture.asset(Assets.img.svg.more),
      onSelected: (value) {
        if (value == 'Delete') {}
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            labelTextStyle: WidgetStatePropertyAll(
                AppTextStyle.deleteWarningReminderBottomSheetTextStyle),
            value: 'Delete',
            child: ClipRRect(
              child: Container(
                width: size.width * 0.18,
                height: size.height * 0.038,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppWidgetColor.deleteBottonTextBottomSheetColor),
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.3,
                  maxHeight: size.height * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        AppString.logoutProfile,
                        style: AppTextStyle
                            .deleteWarningReminderBottomSheetTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
