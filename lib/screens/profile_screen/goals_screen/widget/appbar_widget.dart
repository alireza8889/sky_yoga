import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/string.dart';

class GoalsAppBar extends StatelessWidget implements PreferredSize {
  const GoalsAppBar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(size.width, size.height * 0.07),
      child: Padding(
        padding:
            EdgeInsets.only(left: size.width * 0.04, top: size.height * 0.02),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SizedBox(
                height: size.height * 0.03,
                width: size.width * 0.08,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
            ),
            Center(
              child: AutoSizeText(
                AppString.appBarText,
                style: AppTextStyle.mainAppBar.apply(color: Colors.white),
                minFontSize: 24,
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
                  SvgPicture.asset(
                    Assets.img.svg.arrowLeft,
                    // ignore: deprecated_member_use
                    color: Colors.transparent,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => Size(double.infinity, size.height * 0.07);
}
