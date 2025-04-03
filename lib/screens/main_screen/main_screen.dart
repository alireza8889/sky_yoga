import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:skyyoga/controller/auth_controller/auth_controller.dart';
import 'package:skyyoga/screens/exercise/screens/exercise_screen.dart';
import 'package:skyyoga/screens/main_screen/widget/bottom_navigation.dart';
import 'package:skyyoga/screens/profile_screen/profile_screen.dart';
import 'package:skyyoga/screens/progress/screens/progress_screen.dart';
import 'package:skyyoga/screens/today/screens/today_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int profileIndex = 0;
const int activityIndex = 1;
const int videoPlayerIndex = 2;
const int categoryIndex = 3;

class _MainScreenState extends State<MainScreen> {
  final controller = Get.put(ManageTokenController(), permanent: true);
  int selectedScreenIndex = profileIndex;

  final bool _isBottomNavigationBarVisible = true;

  @override
  void initState() {
    controller.makeNewAccessToken();

    // تنظیم رنگ نوار وضعیت
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // رنگ پس‌زمینه نوار وضعیت
      statusBarIconBrightness: Brightness.dark, // برای اندروید
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light, // برای iOS
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // رنگ پس‌زمینه را سفید کردیم
      body: SafeArea(
        child: Container(
          color: Colors.white, // رنگ `SafeArea` را سفید کردیم
          child: Stack(
            children: [
              Positioned.fill(
                child: _buildScreen(selectedScreenIndex),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: _isBottomNavigationBarVisible
                    ? BottomNavigation(
                        selectedIndex: selectedScreenIndex,
                        onTap: (index) {
                          setState(() {
                            selectedScreenIndex = index;
                          });
                        },
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScreen(int index) {
    switch (index) {
      case profileIndex:
        return ProfileScreen();
      case activityIndex:
        return ProgressScreen();
      case videoPlayerIndex:
        return ExerciseScreen();
      case categoryIndex:
        return TodayScreen();
      default:
        return Container(); // یک ویجت پیش‌فرض در صورت بروز خطا.
    }
  }
}
