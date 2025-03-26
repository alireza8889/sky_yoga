class ApiUrlConstant {
  ApiUrlConstant._();

  static const baseUrl = "https://sky.ezhoosh.com";
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

  //token refresh
  static const tokenRefresh = '$baseUrl/api/v1/users/token/refresh/';




  //exetcise screen
  static const getAllHelpQuestion = '$baseUrl/api/v1/users/recommended-positions/capable/';
  static const sendHelpQuestionAnswersVideoId = '$baseUrl/api/v1/users/records/';

  static const getAllSuggestedExercise = '$baseUrl/api/v1/video-sequence/video-sequence/';
}
