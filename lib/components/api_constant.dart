class ApiUrlConstant {
  ApiUrlConstant._();

  static const baseUrl = "https://sky.ezhoosh.com";

  // Autentication
  static const getUrlFromLogin = '$baseUrl/api/v1/users/login/google/';

  static const postLogin = '$baseUrl/api/v1/users/login/';
  static const postRegister = '$baseUrl/api/v1/users/register/';
  static const postlogout = '$baseUrl/api/v1/users/logout/';
  static const postOtp = '$baseUrl/api/v1/users/register/verify/';
  static const postNewPassword = '$baseUrl/api/v1/users/reset-password/';
  static const postResetPassword =
      '$baseUrl/api/v1/users/reset-password/request';
  static const postOtpResetPassword =
      '$baseUrl/api/v1/users/reset-password/verify-otp/';
  static const postGoogleLogin = '$baseUrl/api/v1/users/auth/google/';
  static const postMakeNewAccessToken = '$baseUrl/api/v1/users/token/refresh/';

  //exercise screen
  static const getAllHelpQuestion =
      '$baseUrl/api/v1/users/recommended-positions/capable/';
  static const sendHelpQuestionAnswersVideoId =
      '$baseUrl/api/v1/users/records/';

  static const getAllSuggestedExercise =
      '$baseUrl/api/v1/video-sequence/video-sequence/';

  // Profile Screen
  static const userProfileToken = '$baseUrl/api/v1/users/profile/';

  // Pain Type Screen
  static const getPainType = '$baseUrl/api/v1/users/pain-types/';

  // Location Screen
  static const getLocation = '$baseUrl/api/v1/users/choices/locations/';

  // Privacy Policy Screen
  static const getPolicy = '$baseUrl/api/v1/meta/privacy-policy/';

  // Term Of Services Screen
  static const getTermOfServices = '$baseUrl/api/v1/meta/terms-of-service/';

  // About Us Screen
  static const getAboutUs = '$baseUrl/api/v1/meta/about-us/';

  // Reminder
  static const getReminder = '$baseUrl/api/v1/users/reminder/';


  //exercise screen

  static const sendAllHelpQuestionAnswersVideoIds =
      '$baseUrl/api/v1/users/records/bulk-create/';



  static const getAllPainArea=
      '$baseUrl/api/v1/users/body-parts/general/';
  static const getAllPastExercises=
      '$baseUrl/api/v1/video-sequence/user-selected-video-sequence/';
  static const getAllSelectingGoals=
      '$baseUrl/api/v1/users/recommended-positions/goals/';
  static const getAllChartData=
      '$baseUrl/api/v1/users/progress/';
  static const sendAllfeelingAnswers=
      '$baseUrl/api/v1/users/state/';
  static const sendAllSelectedPainAreasAnswers=
      '$baseUrl/api/v1/users/injuries/general/bulk-create/';
  static const getAllGoalLevels=
      '$baseUrl/api/v1/users/goals/';
  static const sendSelectedGoalsInProgressScreen=
      '$baseUrl/api/v1/users/goals/bulk-create/';

  static const getAllMoodsForSelectMoodScreen=
      '$baseUrl/api/v1/users/choices/feelings/';
}
