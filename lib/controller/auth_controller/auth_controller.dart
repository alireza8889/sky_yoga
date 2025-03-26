import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/api_constant.dart';
import 'package:skyyoga/screens/auth/forgot_password/otp_forgot_screen.dart';
import 'package:skyyoga/screens/auth/forgot_password/reset_password_screen.dart';
import 'package:skyyoga/screens/auth/login/login_auth.dart';
import 'package:skyyoga/screens/auth/signup/otp_code_screen.dart';
import 'package:skyyoga/screens/onboarding_screen/onboarding_screen.dart';
import 'package:skyyoga/screens/profile_screen/profile_screen.dart';
import 'package:skyyoga/services/dio_services.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  RxList errorEmailMessage = [].obs;
  RxList errorPasswordMessage = [].obs;

  login(BuildContext context, String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };
    try {
      isLoading.value = true;
      errorEmailMessage.clear();
      errorPasswordMessage.clear();

      if (password.length < 8) {
        isLoading.value = false;
        errorPasswordMessage.add("Password must be longer than 8 characters");
      }

      if (EmailValidator.validate(email) && errorPasswordMessage.isEmpty) {
        var response =
            await DioServices().postMethod(map, ApiUrlConstant.postLogin);
        if (response.statusCode == 200) {
          await prefs.setString('email', response.data["data"]["email"]);
          await prefs.setString(
              'refresh_token', response.data["data"]["refresh"]);
          await prefs.setString(
              'access_token', response.data["data"]["access"]);

          isLoading.value = false;
          await AuthController().saveLoginStatus(true);
          Navigator.pushAndRemoveUntil(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
            (route) => false,
          );
        } else if (response.statusCode >= 400 || response.statusCode <= 404) {
          errorEmailMessage.add('Your data for login is incorrect');
          isLoading.value = false;
        }
      } else {
        if (errorPasswordMessage.isEmpty) {
          errorEmailMessage.add('Your email is not valid');
        }
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('access_token').toString();

    Map<String, dynamic> map = {
      'refresh': prefs.getString('refresh_token'),
      'access': prefs.getString('access_token'),
    };

    try {
      var response = await DioServices()
          .postMethodBearer(map, ApiUrlConstant.postlogout, token);
      if (response.statusCode == 200) {
        Get.snackbar(
          "Logout",
          response.data["message"],
        );

        prefs.remove('refresh_token');
        prefs.remove('access_token');
        await AuthController().saveLoginStatus(false);
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => AuthLoginScreen(),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

class SignUpController extends GetxController {
  var isLoading = false.obs;
  RxList errorEmailMessage = [].obs;
  RxList errorPasswordMessage = [].obs;
  RxList errorOtpMessage = [].obs;

  singup(String email, String password) async {
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };

    try {
      isLoading.value = true;
      errorEmailMessage.clear();
      errorPasswordMessage.clear();

      if (password.length < 8) {
        isLoading.value = false;
        errorPasswordMessage.add("Password must be longer than 8 characters");
      }

      if (EmailValidator.validate(email) && errorPasswordMessage.isEmpty) {
        var response =
            await DioServices().postMethod(map, ApiUrlConstant.postRegister);
        if (response.statusCode == 200) {
          Navigator.push(
            Get.context!,
            SlideRightToLeftRoute(
              page: OtpCodeScreen(
                email: email,
                password: password,
              ),
              builder: (context) {},
            ),
          );
          isLoading.value = false;
        } else if (response.statusCode >= 400 || response.statusCode <= 404) {
          errorEmailMessage.add('Your email is already taken');
          isLoading.value = false;
        }
      } else {
        if (errorPasswordMessage.isEmpty) {
          errorEmailMessage.add('Your email is not valid');
        }
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  otpCode(BuildContext context, String email, String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> map = {
      'email': email,
      'otp': otp,
    };

    try {
      isLoading.value = true;
      errorOtpMessage.clear();
      prefs.clear();
      var response =
          await DioServices().postMethod(map, ApiUrlConstant.postOtp);

      if (response.statusCode == 200) {
        await prefs.setString('email', response.data["data"]["email"]);
        await prefs.setString(
            'refresh_token', response.data["data"]["refresh"]);
        await prefs.setString('access_token', response.data["data"]["access"]);
        isLoading.value = false;
        await AuthController().saveLoginStatus(true);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseNameAndGenderScreen(),
          ),
          (route) => false,
        );
      } else {
        errorOtpMessage.add('You entered the wrong code');
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  resendCode(String email, String password) async {
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
    };

    try {
      errorOtpMessage.clear();
      var response =
          await DioServices().postMethod(map, ApiUrlConstant.postRegister);

      if (response.statusCode == 200) {
        print('Resend Code');
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;
  RxList errorEmailMessage = [].obs;
  RxList errorOtpMessage = [].obs;
  RxList errorConfirmMessage = [].obs;

  forgotpass(String email) async {
    Map<String, dynamic> map = {
      'email': email,
    };

    try {
      isLoading.value = true;
      errorEmailMessage.clear();
      var response =
          await DioServices().postMethod(map, ApiUrlConstant.postResetPassword);
      if (response.statusCode == 200) {
        Navigator.push(
          Get.context!,
          SlideRightToLeftRoute(
            page: OtpForgotScreen(
              email: email,
            ),
            builder: (context) {},
          ),
        );
        isLoading.value = false;
      } else if (response.statusCode == 400) {
        errorEmailMessage.add('User with this email does not exist');
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }

  otpForgotPassword(String email, String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> map = {
      "email": email,
      "code": code,
    };

    try {
      isLoading.value = true;
      errorOtpMessage.clear();
      var response = await DioServices()
          .postMethod(map, ApiUrlConstant.postOtpResetPassword);

      if (response.statusCode == 200) {
        await prefs.setString('token', response.data["data"]["token"]);

        isLoading.value = false;
        Navigator.push(
          Get.context!,
          SlideRightToLeftRoute(
            page: ResetPasswordScreen(
              email: prefs.getString('email').toString(),
            ),
            builder: (context) {},
          ),
        );
      } else if (response.statusCode >= 400 && response.statusCode <= 404) {
        errorOtpMessage.add("You entered the wrong code");
        isLoading.value = false;
      }
    } catch (e) {
      errorOtpMessage.add("Songhting was wrong");
      isLoading.value = false;
    }
  }

  resetPassword(String email, String password, String confirmPassword) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    Map<String, dynamic> map = {
      "email": email,
      "token": token,
      "new_password": password,
    };
    try {
      isLoading.value = true;
      errorConfirmMessage.clear();
      if (password == confirmPassword) {
        var response =
            await DioServices().postMethod(map, ApiUrlConstant.postNewPassword);

        if (response.statusCode == 200) {
          Get.snackbar(
              'Reset password', "The change password was successfully");
          Get.to(() => AuthLoginScreen());
          isLoading.value = false;
        } else {
          errorConfirmMessage.add(response.data['message']);
          isLoading.value = false;
        }
      } else {
        errorConfirmMessage.add('Your Password is incorrect');
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
    }
  }
}

class AuthController extends GetxController {
  var isLoggedIn = false.obs;

  Future<void> saveLoginStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', status);
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLoggedIn.value = prefs.getBool('isLoggedIn') ?? false;
  }
//refresh token function
  Future<String> tokenRefresh()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final refreshToken = prefs.getString('refresh_token');
    print(refreshToken);
    var response = await DioServices()
        .postMethod({'refresh':refreshToken}, ApiUrlConstant.tokenRefresh);
    print(response.data);
    // return '';
    if(response.statusCode==200){
      final token=response.data['data']["access"];

      await prefs.setString('access_token',token);

      return token;
    }
    else{
      return '';
    }
  }
}
