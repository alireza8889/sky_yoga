import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skyyoga/components/api_constant.dart';
import 'package:skyyoga/screens/profile_screen/models/remider_model.dart';
import 'package:skyyoga/services/dio_services.dart';

class ReminderController extends GetxController {
  var isLoading = true.obs;
  var reminders = <Reminder>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    getReminders();
    super.onInit();
  }

  void getReminders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access_token').toString();

    Map<String, dynamic> map = {};

    try {
      isLoading(true);
      errorMessage('');
      reminders.clear();

      final response = await DioServices()
          .getMethodBearer(map, ApiUrlConstant.getReminder, token);

      if (response.statusCode == 200) {
        final data = response.data['data'] as List;
        for (int i = 0; i < data.length; i++) {
          reminders.add(Reminder.fromJson(data[i]));
        }
      }
    } catch (e) {
      errorMessage("Error receiving data: ${e.toString()}");
      Get.snackbar("Network Error", errorMessage.value);
    } finally {
      isLoading(false);
    }
  }

  String getDayName(int dayNumber) {
    switch (dayNumber) {
      case 6:
        return 'Sat';
      case 0:
        return 'Sun';
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      default:
        return 'None';
    }
  }

  String formatTime24to12(String time24) {
    try {
      final now = DateTime.now();
      final dt =
          DateTime.parse('${DateFormat('yyyy-MM-dd').format(now)}T$time24');
      final format = DateFormat('h:mm a');
      return format.format(dt);
    } catch (e) {
      return 'Timer is none';
    }
  }

  
}
