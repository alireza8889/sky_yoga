import 'package:flutter/material.dart';

class AppTextColor {
  AppTextColor._();

  // Loader Screen
  static const Color titleLoadingVideoColor = Color(0xFF272A2F);

  // Video Player Screen
  static const Color timerVidoePlayerColor = Color(0xFFffffff);
  static const Color titleListVidoePlayerColor = Color(0xFF272A2F);
  static const Color titleVidoePlayerColor = Color(0xFF272A2F);
  static const Color categoryVidoePlayerColor = Color(0xFF272A2F);
  static const Color descriptionVidoePlayerColor = Color(0xFF5A5A5A);
  static const Color titleBottomSheetVidoePlayerColor = Color(0xFFFFFFFF);
  static const Color titleMusicinPlayerBottomSheetVideoPlayerColor =
      Color(0xFFFFFFFF);
  static const Color artistMusicinPlayerBottomSheetVideoPlayerColor =
      Color(0xFFFFFFFF);
  static const Color titleCategoryMusicPlayerBottomSheetVideoPlayerColor =
      Color(0xFFFFFFFF);
  static const Color artistCategoryMusicPlayerBottomSheetVideoPlayerColor =
      Color(0xFFFFFFFF);

  // Auth Screens
  // Login
  static const Color titleAuthColor = Color(0xff191D2D);
  static const Color appBarAuthColor = Color(0xff191D2D);
  static const Color skipBottonAuthColor = Color(0xff333F66);
  static const Color descriptionAuthColor = Color(0xff7A7F85);
  static const Color textBottonAuthColor = Color(0xff191D2D);
  static const Color accountLoginSignUpAuthColor = Color(0xff7A7F85);
  static const Color forgotPasswordColor = Color(0xff626262);
  static const Color bottonSubmitColor = Color(0xffffffff);
  static const Color loginOrSignUpAuthColor = Color(0xff333F66);
  static const Color errorAuthColor = Color(0xffF03333);

  // OTP Screen
  static const Color showOtpAuthColor = Color(0xff191D2D);
  static const Color timerOtpAuthColor = Color(0xff191D2D);

  // Onboarding screen
  static const Color onboardingChooseIndexColor = Color(0xff191D2D);
  static const Color onboardingWelcomeTextColor = Color(0xff000000);

  // Profile Screen
  static const Color titleProfileVerticlaBottonColor = Color(0xFF000000);
  static const Color titleProfileBottonHorizontalColor = Color(0xFF7A7F85);
  static const Color subTitleProfileColor = Color(0xFF191D2D);
  static const Color logoutProfileColor = Color(0xFFF03333);

  //exercise screen
  static const Color exerciseScreenTitle = Color(0xff070707);
  static const Color suggestedExerciseTitle = Color(0xff0e0e0e);

  static const Color exerciseScreenDescription = Color(0xff444444);
  static const Color toUnlockDescription = Color(0xffffffff);
  static const Color getStartButtonText = Color(0xffffffff);



  //help question screen
  static const Color helpScreenQuestion = Color(0xffffffff);

  //progress screen
  static const Color chartLabelColor = Color(0xff000000);


  //today
  static const Color setMoodButtonTextColor = Color(0xfffffefe);

}

class AppWidgetColor {
  AppWidgetColor._();

  // Main BackGround Screen
  static Color bgColor = Color(0xFF9FB2DE);

  // Video player Screen Color
  static const Color activeTrackColor = Color(0xffffffff);
  static const Color inactiveTrackColor = Color(0x80FFFFFF);
  static const Color categoryColor = Color(0x25FFFFFF);
  static const Color bottonVideoPlayerColor = Color(0x23000000);
  static const Color backgroundSliderVideoPlayerColor = Color(0x23000000);
  static const Color bottomSheetVideoPlayerColor =
      Color.fromRGBO(0, 0, 0, 0.70);
  static List<Color> gradientColorVideoPlayerScreen = [
    Color.fromRGBO(159, 178, 222, 1),
    Color.fromRGBO(159, 178, 222, 0.5),
    Color.fromRGBO(167, 184, 225, 0),
  ];

  // Loader Screen
  static List<Color> bgColorLoaderVideoScreen = [
    Color.fromRGBO(159, 178, 222, 1),
    Color.fromRGBO(159, 178, 222, 0.5),
  ];

  // Auth Screens
  // Login
  static const Color bgColorAuth = Color(0xFFF0F3FB);
  static const Color bgBottomAuth = Color(0xFFFFFFFF);
  static const Color borderColor = Color(0x33000000);
  static const Color borderSideTextFieldAuth = Color(0xff42A5F5);
  static const Color activeBotton = Color(0xff191D2D);
  static const Color unactiveButton = Color(0xffABB0BA);
  static List<Color> bgColorAuthScreen = [
    Color(0xFFFCFCFE),
    Color(0xFFF0F3FB),
  ];

  // Onboarding Screen
  static const Color borderSelectedChooseGender = Color(0xff42A5F5);
  static const Color borderOnSelectedChooseGender = Color(0x33000000);
  static const Color bgSelectedChooseGender = Color(0x0B42A5F5);
  static const Color bgOnSelectedChooseGender = Color(0x00000000);


  //exercise_screen
  static const Color suggestedBox = Color(0xffbfc5c7);
  static const Color suggestedExerciseItem = Color(0xca656767);
  static const Color exerciseScreenGetStartButton = Color(0xff000000);

  //help question screen
  static const Color helpQuestionScreenContinueButton = Color(0xca343F66);
  static const Color helpQuestionScreenbackgroundColor = Color(0xca2D2132);
  static const Color helpQuestionScreenbackgroundColor2 = Color(0xca191E20);

  static List<Color> gradientBackgroundHelpQuestionScreen = [
    AppWidgetColor.helpQuestionScreenbackgroundColor,
    AppWidgetColor.helpQuestionScreenbackgroundColor,
    AppWidgetColor.helpQuestionScreenbackgroundColor2,
    AppWidgetColor.helpQuestionScreenbackgroundColor2,
    AppWidgetColor.helpQuestionScreenbackgroundColor2,
    AppWidgetColor.helpQuestionScreenbackgroundColor2,
  ];


  //select gaols screen
  static const Color selectGoalsScreenNotActiveButton = Color(0xca8D8E96);
  static const Color selectGoalsScreenActiveButton = Color(0xca343F66);



  //today
  static const Color selectMoodsButtonGradient1 = Color(0x7effffff);
  static const Color selectMoodsButtonGradient2 = Color(0xffffff);
  static List<Color> selectMoodsButtonGradient = [
    AppWidgetColor.selectMoodsButtonGradient1,
    AppWidgetColor.selectMoodsButtonGradient2,

  ];
  static const Color selectMoodsScreenGradient1 = Color(0xfd2894f8);
  static const Color selectMoodsScreenGradient2 = Color(0xffffffff);
  static List<Color> selectMoodsScreenGradient = [

    AppWidgetColor.selectMoodsScreenGradient1,
    AppWidgetColor.selectMoodsScreenGradient2,

  ];

  static const Color setMoodButtonBackGround = Color(0xff191d2d);


}
