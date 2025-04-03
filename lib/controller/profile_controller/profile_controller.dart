import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/api_constant.dart';
import 'package:skyyoga/screens/main_screen/main_screen.dart';
import 'package:skyyoga/screens/onboarding_screen/models/user_profile_model.dart';
import 'package:skyyoga/services/dio_services.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;

  Future<void> updateProfile({
    required int index,
    required BuildContext context,
    required String name,
    required String gender,
    required List<String> mainFocuses,
    required Widget page,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token');

    try {
      isLoading(true);

      final profileData = UserProfileModel(
        name: name.toString(),
        gender: gender.toString(),
        location: "US",
        mainFocuses: mainFocuses,
      );

      var response = await DioServices().patchMethod(
        data: profileData,
        token: token.toString(),
        url: ApiUrlConstant.userProfileToken,
      );
      if (response!.statusCode == 200) {
        prefs.remove('username');
        prefs.remove('gender');

        await prefs.setString('username', name);
        await prefs.setString('gender', gender);

        if (index == 1) {
          Navigator.of(Get.context!).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => MainScreen()),
            (route) => false,
          );
        } else {
          navigatePushWithFadeTransition(Get.context!, page);
        }
        isLoading(false);
      } else {
        Get.snackbar('Error',
            'Failed to update profile: ${response.data?['message'] ?? 'Unknown error'}',
            colorText: Colors.white, backgroundColor: Colors.red);
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
