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
import 'package:skyyoga/screens/profile_screen/about_sky_screen/about_sky_screen.dart';
import 'package:skyyoga/screens/profile_screen/account_info_screen/account_info.dart';
import 'package:skyyoga/screens/profile_screen/goals_screen/goals_screen.dart';
import 'package:skyyoga/screens/profile_screen/injuries_screen/injuires_screen.dart';
import 'package:skyyoga/screens/profile_screen/language_screen/language_screen.dart';
import 'package:skyyoga/screens/profile_screen/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:skyyoga/screens/profile_screen/subscription_screen/subscription_payment.dart';
import 'package:skyyoga/screens/profile_screen/term_of_service_screen/term_of_service_screen.dart';
import 'package:skyyoga/screens/profile_screen/widget/bottom.dart';
import 'package:skyyoga/screens/profile_screen/widget/feedback_bottom_sheet_widget.dart';
import 'package:skyyoga/screens/profile_screen/widget/reminder_widget.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isBottomSheetOpen = false;
  TextEditingController bottomSheetTextcontroller = TextEditingController();
  var controller = Get.put(LoginController());

  void toggleBottomSheet() {
    setState(() {
      _isBottomSheetOpen = !_isBottomSheetOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * 0.1),
          child: Container(
            color: AppWidgetColor.appBarColor,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: Text(
                      AppString.titleProfile,
                      style: AppTextStyle.mainTitle,
                    ),
                  ),
                  LogoutBotton(controller: controller, size: size),
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
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: size.width * 0.04,
                    left: size.width * 0.04,
                  ),
                  child: Column(
                    spacing: size.height * 0.03,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: size.width * 0.25,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                navigatePushWithFadeTransition(context,
                                    ChooseInjuriesFrontProfileScreen());
                              },
                              child: TitleBottonProfileVertical(
                                size: size,
                                text: AppString.injuriesProfile,
                                svgPic: SvgPicture.asset(
                                  Assets.img.svg.injuriesIcon.toString(),
                                  width: size.width * 0.06,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                navigatePushWithFadeTransition(
                                  context,
                                  GoalsScreen(),
                                );
                              },
                              child: TitleBottonProfileVertical(
                                size: size,
                                text: AppString.goalsProfile,
                                svgPic: Icon(
                                  Iconsax.award,
                                  size: size.width * 0.06,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggleBottomSheet();
                                  if (_isBottomSheetOpen) {
                                    Get.bottomSheet(
                                      ShowReminderWidget(size: size),
                                      isScrollControlled: false,
                                    ).whenComplete(() {
                                      toggleBottomSheet();
                                    });
                                  }
                                });
                              },
                              child: TitleBottonProfileVertical(
                                size: size,
                                text: AppString.reminderProfile,
                                svgPic: SvgPicture.asset(
                                  Assets.img.svg.clock,
                                  width: size.width * 0.06,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        spacing: size.height * 0.03,
                        children: [
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
                                page: SubscriptionPayment(),
                              ),
                              BottonProfileHorizontal(
                                size: size,
                                text1: AppString.accountInfoProfile,
                                text2: '',
                                icon1: SvgPicture.asset(
                                  Assets.img.svg.profile,
                                  width: size.width * 0.06,
                                ),
                                icon2: SvgPicture.asset(
                                  Assets.img.svg.edit,
                                ),
                                page: AccountInfoScreen(),
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
                                page: LanguageScreen(),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                AppString.supportUsProfile,
                                style: AppTextStyle.subTitleProfileTextStyle,
                              ),
                            ],
                          ),
                          Column(
                            spacing: size.height * 0.02,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    toggleBottomSheet();
                                    if (_isBottomSheetOpen) {
                                      Get.bottomSheet(
                                        FeedBackBottomSheetWIdget(size: size),
                                        isScrollControlled: true,
                                      ).whenComplete(() {
                                        toggleBottomSheet();
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  constraints: BoxConstraints(
                                    maxHeight: size.height * 0.07,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppWidgetColor.borderColor,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            spacing: size.width * 0.02,
                                            children: [
                                              Icon(
                                                Iconsax.like_dislike,
                                                size: size.width * 0.06,
                                              ),
                                              Text(
                                                AppString.feedbackProfile,
                                                style: AppTextStyle
                                                    .titleProfileBottonVerticlaTextStyle
                                                    .apply(
                                                        fontSizeFactor: 1.05),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            spacing: size.width * 0.04,
                                            children: [
                                              Text(
                                                '',
                                                style: AppTextStyle
                                                    .titleProfileBottonHorizontalTextStyle
                                                    .apply(
                                                        fontSizeFactor: 1.05),
                                              ),
                                              Icon(
                                                Iconsax.arrow_right_34,
                                                size: size.width * 0.04,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                page: PrivacyPolicyScreen(),
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
                                page: TermOfServiceScreen(),
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
                                page: AboutSkyScreen(),
                              ),
                              SizedBox(
                                height: size.height * 0.15,
                              )
                            ],
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
