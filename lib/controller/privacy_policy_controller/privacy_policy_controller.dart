import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/api_constant.dart';
import 'package:skyyoga/services/dio_services.dart';

class PrivacyPolicyController extends GetxController {
  var isLoadin = false.obs;
  var text = ''.obs;

  getPrivacyPolicy() async {
    Map<String, dynamic> map = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token').toString();
    isLoadin(true);

    try {
      var response = await DioServices()
          .getMethodBearer(map, ApiUrlConstant.getPolicy, token);

      if (response.statusCode == 200) {
        text.value = response.data['data']['content'];
        isLoadin(false);
      } else {
        isLoadin(false);
      }
    } catch (e) {
      isLoadin(false);
    }
  }
}
