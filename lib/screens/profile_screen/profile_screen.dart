import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/profile_screen/widget/bottom.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: Container(
            color: Color(0xFFFCFCFE),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      AppString.titleProfile,
                      style: AppTextStyle.mainTitle,
                    ),
                  ),
                  PopupMenuButton<String>(
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
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)),
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
                                          color:
                                              AppTextColor.logoutProfileColor,
                                        ),
                                        Text(
                                          AppString.logoutProfile,
                                          style: AppTextStyle.logtoutTextStyle,
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
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: BackGroundColor(),
            ),
            SizedBox(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.02,
                    right: size.width * 0.04,
                    left: size.width * 0.04,
                  ),
                  child: Column(
                    spacing: size.height * 0.03,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: size.height * 0.11,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleBottonProfileVertical(
                              size: size,
                              text: AppString.injuriesProfile,
                              svgPic: SvgPicture.asset(
                                Assets.img.svg.injuriesIcon.toString(),
                                width: size.width * 0.06,
                              ),
                            ),
                            TitleBottonProfileVertical(
                              size: size,
                              text: AppString.goalsProfile,
                              svgPic: Icon(
                                Iconsax.award,
                                size: size.width * 0.06,
                              ),
                            ),
                            TitleBottonProfileVertical(
                              size: size,
                              text: AppString.reminderProfile,
                              svgPic: SvgPicture.asset(
                                Assets.img.svg.clock,
                                width: size.width * 0.06,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        spacing: size.height * 0.02,
                        children: [
                          BottonProfileHorizontal(
                            size: size,
                            text1: AppString.subscriptionProfile,
                            text2: '',
                            icon1: Icon(
                              Iconsax.wallet_2,
                              size: size.width * 0.06,
                            ),
                            icon2: Icon(
                              Iconsax.arrow_right_34,
                              size: size.width * 0.04,
                            ),
                          ),
                          BottonProfileHorizontal(
                            size: size,
                            text1: AppString.accountInfoProfile,
                            text2: '',
                            icon1: SvgPicture.asset(
                              Assets.img.svg.profile,
                              width: size.width * 0.06,
                            ),
                            icon2: Icon(
                              Iconsax.arrow_right_34,
                              size: size.width * 0.04,
                            ),
                          ),
                          BottonProfileHorizontal(
                            size: size,
                            text1: AppString.languageProfile,
                            text2: AppString.languageSubTitleProfile,
                            icon1: Icon(
                              Iconsax.global,
                              size: size.width * 0.06,
                            ),
                            icon2: Icon(
                              Iconsax.arrow_right_34,
                              size: size.width * 0.04,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            'Support us',
                            style: AppTextStyle.subTitleProfileTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        spacing: size.height * 0.02,
                        children: [
                          BottonProfileHorizontal(
                            size: size,
                            text1: AppString.feedbackProfile,
                            text2: '',
                            icon1: Icon(
                              Iconsax.like_dislike,
                              size: size.width * 0.06,
                            ),
                            icon2: Icon(
                              Iconsax.arrow_right_34,
                              size: size.width * 0.04,
                            ),
                          ),
                          BottonProfileHorizontal(
                            size: size,
                            text1: AppString.privacyPolicyProfile,
                            text2: '',
                            icon1: Icon(
                              Iconsax.lock_1,
                              size: size.width * 0.06,
                            ),
                            icon2: Icon(
                              Iconsax.arrow_right_34,
                              size: size.width * 0.04,
                            ),
                          ),
                          BottonProfileHorizontal(
                            size: size,
                            text1: AppString.termOfServiceyProfile,
                            text2: '',
                            icon1: Icon(
                              Iconsax.document_text_1,
                              size: size.width * 0.06,
                            ),
                            icon2: Icon(
                              Iconsax.arrow_right_34,
                              size: size.width * 0.04,
                            ),
                          ),
                          BottonProfileHorizontal(
                            size: size,
                            text1: AppString.aboutSkyProfile,
                            text2: '',
                            icon1: Icon(
                              Iconsax.info_circle,
                              size: size.width * 0.06,
                            ),
                            icon2: Icon(
                              Iconsax.arrow_right_34,
                              size: size.width * 0.04,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
