import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/string.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    super.key,
    required this.size,
    required this.isback,
    required this.text,
  });

  final Size size;
  final String text;
  final bool isback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            width: size.width * 0.15,
            height: size.height * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isback
                    ? SvgPicture.asset(
                        Assets.img.svg.arrowLeft,
                        // ignore: deprecated_member_use
                        color: Colors.black,
                      )
                    : SizedBox(
                        width: size.width * 0.15,
                      ),
              ],
            ),
          ),
        ),
        Center(
          child: AutoSizeText(
            text,
            style: AppTextStyle.mainAppBar,
            minFontSize: 12,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: size.width * 0.15,
          height: size.height * 0.04,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isback
                  ? SvgPicture.asset(
                      Assets.img.svg.arrowLeft,
                      // ignore: deprecated_member_use
                      color: Colors.transparent,
                    )
                  : SizedBox(
                      width: size.width * 0.15,
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppBar(
      backgroundColor: Color(0xFFFCFCFE),
      surfaceTintColor: Color(0xFFFCFCFE),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox(
          width: size.width * 0.15,
          height: size.height * 0.04,
          child: Icon(
            Iconsax.arrow_left_24,
            size: size.width * 0.06,
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AutoSizeText(
              title,
              style: AppTextStyle.mainAppBar,
              minFontSize: 12,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: size.width * 0.1,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppBarSubscription extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLeadingPressed;
  final bool iconMore;

  const AppBarSubscription({
    super.key,
    required this.title,
    this.onLeadingPressed,
    required this.iconMore,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFFFCFCFE),
      surfaceTintColor: Color(0xFFFCFCFE),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                Assets.img.svg.arrowLeft,
                // ignore: deprecated_member_use
                color: Colors.black,
              )),
          AutoSizeText(
            title,
            style: AppTextStyle.mainAppBar,
            minFontSize: 12,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          iconMore
              ? MoreBotton(
                  size: size,
                  text: AppString.cancelSubscription,
                )
              : SizedBox(
                  width: size.width * 0.1,
                )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class MoreBotton extends StatelessWidget {
  const MoreBotton({
    super.key,
    required this.size,
    required this.text,
  });

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      position: PopupMenuPosition.under,
      icon: SvgPicture.asset(Assets.img.svg.more),
      onSelected: (value) {
        if (value == 'Cancel') {}
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'Cancel',
            height: size.height * 0.028,
            child: ClipRRect(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.4,
                  maxHeight: size.height * 0.04,
                ),
                child: Center(
                  child: Text(
                    text,
                    style: AppTextStyle.moreBottomTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}
