import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/screens/main_screen/main_screen.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;

  const BottomNavigation(
      {super.key, required this.onTap, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.only(
        right: size.width * 0.04,
        left: size.width * 0.04,
        bottom: size.height * 0.02,
      ),
      child: Container(
        width: double.infinity,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppWidgetColor.bottomNavigationColor,
          borderRadius: BorderRadius.circular(24),
        ),
        // Icons Navigation
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationItems(
              size: size,
              icon: Icon(
                Iconsax.category,
                size: size.height * 0.03,
                color: Colors.white,
              ),
              iconActive: SvgPicture.asset(Assets.img.svg.categoryActive),
              isActive: selectedIndex == categoryIndex,
              onTap: () {
                onTap(categoryIndex);
              },
            ),
            BottomNavigationItems(
              size: size,
              icon: Icon(
                Iconsax.video_play,
                size: size.height * 0.03,
                color: Colors.white,
              ),
              iconActive: SvgPicture.asset(Assets.img.svg.videoPlayActive),
              isActive: selectedIndex == videoPlayerIndex,
              onTap: () {
                onTap(videoPlayerIndex);
              },
            ),
            BottomNavigationItems(
              size: size,
              icon: Icon(
                Iconsax.activity,
                size: size.height * 0.03,
                color: Colors.white,
              ),
              iconActive: SvgPicture.asset(Assets.img.svg.activityActive),
              isActive: selectedIndex == activityIndex,
              onTap: () {
                onTap(activityIndex);
              },
            ),
            BottomNavigationItems(
              size: size,
              icon: Icon(
                Iconsax.user,
                color: Colors.white,
                size: size.height * 0.03,
              ),
              iconActive: SvgPicture.asset(Assets.img.svg.profileActive),
              isActive: selectedIndex == profileIndex,
              onTap: () {
                onTap(profileIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationItems extends StatelessWidget {
  const BottomNavigationItems({
    super.key,
    required this.size,
    required this.icon,
    required this.iconActive,
    required this.isActive,
    required this.onTap,
  });

  final Size size;
  final Widget icon;
  final Widget iconActive;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isActive ? iconActive : icon,
          ],
        ),
      ),
    );
  }
}
