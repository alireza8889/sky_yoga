import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/screens/auth/login/login_auth.dart';
import 'package:skyyoga/screens/exercise/screens/exercise_screen.dart';
import 'package:skyyoga/screens/exercise/screens/help_question_screen.dart';
import 'package:skyyoga/screens/progress/screens/progress_screen.dart';
import 'package:skyyoga/screens/today/screens/mood_selection_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authController = Get.put(AuthController(),permanent: true);
  await authController.checkLoginStatus();

//   runApp(
//     const MyApp(),
//   );
// }
      runApp(
        DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp(), // Wrap your app
        ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // title: 'Sky',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      home: Obx(
        () {
          final authController = Get.find<AuthController>();
          return authController.isLoggedIn.value
              ? MoodSelectionScreen()
              : ExerciseScreen();
        },
      ),
      // home: Obx(
      //   () {
      //     final authController = Get.find<AuthController>();
      //     return authController.isLoggedIn.value
      //         ? ProfileScreen()
      //         : AuthLoginScreen();
      //   },
      // ),
    );
  }
}
