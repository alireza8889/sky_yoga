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

  // Subscription Payment Screen
  static final titlePaymentMessage = GoogleFonts.montserrat(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.titlePaymentColor,
  );

  // Goals Screen
  static final titleGoalTextStyle = GoogleFonts.montserrat(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppTextColor.titleGoalColorText);

  // Main AppBar
  static final mainAppBar = GoogleFonts.montserrat(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.mainAppBarColor,
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
  static final frontOrBackSelectedTextStyle = GoogleFonts.montserrat(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppTextColor.frontOrBackSelectedTextColor,
  );
  static final backOrBackSelectedTextStyle = GoogleFonts.montserrat(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.backOrBackSelectedTextColor,
  );
  static final selectedIndexInInjurisbodyTextStyle = GoogleFonts.montserrat(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppTextColor.selectedIndexInInjurisbodyTextColor,
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
  static final moreBottomTextStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.logoutProfileColor);

  // Location screen
  static final chooseLocationTextStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.locationColor);

  // Account Info
  static final labelTextStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.labelAccountInfoColor);
  static final textFieldTextStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      color: AppTextColor.textFieldAccountInfoColor);

  // Privacy policy Screen
  static final textPrivacyPolicyTextStyle = GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.textPrivacyPolicyColor);

  // Feed Back
  static final titleBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.titleBottomSheetColor,
  );
  static final textBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.titleBottomSheetColor,
  );
  static final labelTextBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.lableTextBottomSheetColor,
  );

  // Reminder Screen
  static final textTimeBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.textTimeBottomSheetColor,
  );
  static final daysOfTheWeekBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.daysOfTheWeekTextBottomSheetColor,
  );
  static final timeSetReminderBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.titleTimeRminderBottomSheetColor,
  );
  static final subTitleTxetReminderBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.titleTimeRminderBottomSheetColor,
  );
  static final daysOfWeekReminderBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.daysOfTheWeekTextBottomSheetColor,
  );
  static final deleteWarningReminderBottomSheetTextStyle = GoogleFonts.openSans(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.deleteBottonTextBottomSheetColor,
  );

  // Subscription Screen
  static final titleSubscriptionBottonTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
  );
  static final titlePlanToContinueTextStyle = GoogleFonts.openSans(
    fontSize: 17,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.titlePlanToContinueColor,
  );
  static final priceTextStyle = GoogleFonts.openSans(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.priceColor,
  );
  static final offPriceTextStyle = GoogleFonts.openSans(
    fontSize: 10,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.offPriceColor,
  );
  static final servicesTextStyle = GoogleFonts.openSans(
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.servicesColor,
  );
  static final hintTextFieldTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.hintTextFieldColor,
  );
  static final saveCardTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.saveCardFieldColor,
  );
  static final showSubscriptionDateTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: AppTextColor.saveCardFieldColor,
  );
  static final walletDataTextStyle = GoogleFonts.openSans(
    fontSize: 12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.walletDataColor,
  );
  static final transactionDateTextStyle = GoogleFonts.openSans(
    fontSize: 15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.transactionDateColor,
  );
  static final titleTransactionsTextStyle = GoogleFonts.openSans(
    fontSize: 18,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.titletransactionColor,
  );
  static final titleAllTransactionsTextStyle = GoogleFonts.openSans(
    fontSize: 16,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppTextColor.titleAllTransactionColor,
  );

//exercise screen
  static final suggestedExerciseScreenDescriptionStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.exerciseScreenTitle);

  static final pastExerciseWidgetDescriptionStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenDescription);
  static final pastExerciseWidgetTitleStyle = GoogleFonts.openSans(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.exerciseScreenTitle);

  static final exerciseScreenTitle = GoogleFonts.openSans(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);

  static final toUnlockDescripthyionStyle = GoogleFonts.openSans(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.toUnlockDescription);

  static final exerciseScreenDescriptionStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.exerciseScreenTitle);

  static final getStartButton = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: AppTextColor.helpScreenQuestion);

  static final pastExerciseScreenDescriptionStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: AppTextColor.exerciseScreenDescription);

  static final suggestedExerciseItemTilteStyle = GoogleFonts.openSans(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.suggestedExerciseTitle);

  static final toUnlockDescriptionStyle = GoogleFonts.openSans(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.toUnlockDescription);

  static final helperQuestion = GoogleFonts.openSans(
      fontSize: 25,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.helpScreenQuestion);

  //progress screen
  static final selectGoalsItemTilteStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: AppTextColor.chartLabelColor);
  static final SetGoalsButtonTextStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.setGoalButtonTextColor);
  static final progressScreenGoalsTitle = GoogleFonts.openSans(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);

  static final progressScreenDescriptionStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.exerciseScreenDescription);

  static final chartLabelStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: AppTextColor.chartLabelColor);

  //today
  static final setMoodButtonTextStyle = GoogleFonts.openSans(
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.setMoodButtonTextColor);
  static final todayScreenAppBarTitle = GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w100,
      color: AppTextColor.exerciseScreenTitle);

  static final todayScreenTitle = GoogleFonts.openSans(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);

  static final todayScreenDescriptionStyle = GoogleFonts.openSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppTextColor.exerciseScreenTitle);

  static final todayScreenBottomSheetQuestion = GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: AppTextColor.exerciseScreenTitle);
  static final todayScreenQuestion2TimeTextStyle = GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);

  static final todayScreenBottomSheetQuestion4 = GoogleFonts.openSans(
      fontSize: 22,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.exerciseScreenTitle);
  static final todayScreenBottomSheetQuestionOkButton = GoogleFonts.openSans(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      color: AppTextColor.todayBottomSheetOkButtonColorText);
  static final todayScreenBottomGridviewText = GoogleFonts.openSans(
      fontSize: 13,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      color: AppTextColor.todayScreenBottomGridviewText);
}
