import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skyyoga/res/colors.dart';

class AppTextStyle {
  AppTextStyle._();

  // Main Text Style
  static final mainTitle = GoogleFonts.montserrat(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.titleAuthColor,
  );

  // Loader Text Video
  static final titleLoadingVideo = GoogleFonts.openSans(
    fontSize: 24,
    color: AppTextColor.titleLoadingVideoColor,
    fontWeight: FontWeight.w700,
  );

  // Video Player
  static final timerVideoPlayer = GoogleFonts.openSans(
    fontSize: 12,
    color: AppTextColor.timerVidoePlayerColor,
    fontWeight: FontWeight.w500,
  );
  static final titleListVideoPlayer = GoogleFonts.openSans(
    fontSize: 10,
    color: AppTextColor.titleListVidoePlayerColor,
    fontWeight: FontWeight.w300,
  );
  static final titleListSelectedVideoPlayer = GoogleFonts.openSans(
    fontSize: 10,
    color: AppTextColor.titleListVidoePlayerColor,
    fontWeight: FontWeight.w700,
  );
  static final titleVideoPlayer = GoogleFonts.openSans(
    fontSize: 30,
    color: AppTextColor.titleVidoePlayerColor,
    fontWeight: FontWeight.w900,
  );
  static final categoryVideoPlayer = GoogleFonts.openSans(
    fontSize: 12,
    color: AppTextColor.categoryVidoePlayerColor,
    fontWeight: FontWeight.w300,
  );
  static final descriptionVideoPlayer = GoogleFonts.openSans(
    fontSize: 17,
    color: AppTextColor.descriptionVidoePlayerColor,
    fontWeight: FontWeight.w300,
  );
  static final titleBottomSheetVideoPlayer = GoogleFonts.openSans(
    fontSize: 17,
    color: AppTextColor.titleBottomSheetVidoePlayerColor,
    fontWeight: FontWeight.w300,
  );
  static final titleMusicinPlayerBottomSheetVideoPlayer = GoogleFonts.openSans(
    fontSize: 15,
    color: AppTextColor.titleMusicinPlayerBottomSheetVideoPlayerColor,
    fontWeight: FontWeight.w300,
  );
  static final artistMusicinPlayerBottomSheetVideoPlayer = GoogleFonts.openSans(
    fontSize: 10,
    color: AppTextColor.artistMusicinPlayerBottomSheetVideoPlayerColor,
    fontWeight: FontWeight.w300,
  );
  static final titleCategoryMusicPlayerBottomSheetVideoPlayer =
      GoogleFonts.openSans(
    fontSize: 15,
    color: AppTextColor.titleCategoryMusicPlayerBottomSheetVideoPlayerColor,
    fontWeight: FontWeight.w700,
  );
  static final artistCategoryMusicPlayerBottomSheetVideoPlayer =
      GoogleFonts.openSans(
    fontSize: 10,
    color: AppTextColor.artistCategoryMusicPlayerBottomSheetVideoPlayerColor,
    fontWeight: FontWeight.w700,
  );

  // Auth Screens & Login Screen
  static final skipBottonAuth = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.skipBottonAuthColor,
  );
  static final descreptionAuth = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.descriptionAuthColor,
  );
  static final descreptionOTPAuth = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.descriptionAuthColor,
  );
  static final showEmailOtpAuth = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.showOtpAuthColor,
  );
  static final textBottonAuth = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.textBottonAuthColor,
  );
  static final accountLoginSignUpAuth = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.accountLoginSignUpAuthColor,
  );
  static final loginOrSignUpAuth = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.loginOrSignUpAuthColor,
    decoration: TextDecoration.underline,
    decorationThickness: 1.0,
  );
  static final resendCode = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.loginOrSignUpAuthColor,
    decoration: TextDecoration.underline,
    decorationThickness: 1.0,
  );
  static final appBarAuth = GoogleFonts.openSans(
    fontSize: 24,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
    color: AppTextColor.appBarAuthColor,
  );
  static final textFieldInputAuth = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static final labelTextFieldInputAuth = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );
  static final forgotPasswordTextStyle = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.forgotPasswordColor,
  );
  static final bottonSubmitTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.bottonSubmitColor,
  );
  static final errorTextStyle = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppTextColor.errorAuthColor,
  );
  static final timerTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.timerOtpAuthColor,
  );

  // Onboarding Screen
  static final onboardingChooseIndexTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.onboardingChooseIndexColor,
  );
  static final onboardingWelcomeTextStyle = GoogleFonts.montserrat(
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.onboardingWelcomeTextColor,
  );

  // Profile Screen
  static final titleProfileBottonVerticlaTextStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppTextColor.titleProfileVerticlaBottonColor);
  static final titleProfileBottonHorizontalTextStyle = GoogleFonts.openSans(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.titleProfileBottonHorizontalColor);
  static final subTitleProfileTextStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.subTitleProfileColor);
  static final logtoutTextStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.logoutProfileColor);

//exercise screen
  static final exerciseScreenTitle=GoogleFonts.openSans(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);

  static final exerciseScreenDescriptionStyle=GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.exerciseScreenTitle);

  static final pastExerciseScreenDescriptionStyle=GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: AppTextColor.exerciseScreenDescription);

  static final suggestedExerciseItemTilteStyle=GoogleFonts.openSans(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.suggestedExerciseTitle);

  static final toUnlockDescriptionStyle=GoogleFonts.openSans(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.toUnlockDescription);

  static final helperQuestion=GoogleFonts.openSans(
      fontSize: 25,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.helpScreenQuestion);


  //progress screen
  static final progressScreenGoalsTitle=GoogleFonts.openSans(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);

  static final progressScreenDescriptionStyle=GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.exerciseScreenDescription);


  static final chartLabelStyle=GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color:AppTextColor.chartLabelColor);


  //today
  static final setMoodButtonTextStyle=GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color:AppTextColor.setMoodButtonTextColor);
  static final todayScreenAppBarTitle=GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w100,
      color:AppTextColor.exerciseScreenTitle);

  static final todayScreenTitle=GoogleFonts.openSans(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);

  static final todayScreenDescriptionStyle=GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.exerciseScreenTitle);

  static final todayScreenBottomSheetQuestion=GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: AppTextColor.exerciseScreenTitle);
  static final todayScreenQuestion2TimeTextStyle=GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);

  static final todayScreenBottomSheetQuestion4=GoogleFonts.openSans(
      fontSize: 22,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);
  static final todayScreenBottomSheetQuestionOkButton=GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.todayBottomSheetOkButtonColorText);
  static final todayScreenBottomGridviewText=GoogleFonts.openSans(
      fontSize: 13,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: AppTextColor.todayScreenBottomGridviewText);


}
