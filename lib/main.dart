import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/screens/auth/login/login_auth.dart';
import 'package:skyyoga/screens/main_screen/main_screen.dart';

import 'controller/network_manager/network_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final authController = Get.put(AuthController());
  Get.put(NetworkManager());

  await authController.checkLoginStatus();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
              ? MainScreen()
              : AuthLoginScreen();
        },
      ),
    );
  }
}
