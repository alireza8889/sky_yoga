import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/api_constant.dart';
import 'package:skyyoga/services/dio_services.dart';

class AboutUsController extends GetxController {
  var isLoadin = false.obs;
  var text = ''.obs;

  getAboutUs() async {
    Map<String, dynamic> map = {};
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token').toString();
    isLoadin(true);

    try {
      var response = await DioServices()
          .getMethodBearer(map, ApiUrlConstant.getAboutUs, token);
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
