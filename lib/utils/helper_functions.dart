
import 'dart:ui';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppHelperFunctions {
  static void showSnackBar(String message) {
    final context = Get.context!;
    final overlay = Navigator.of(context).overlay; // دریافت `OverlayState`

    if (overlay == null) {
      debugPrint("Overlay not found!");
      return;
    }

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 10 , // فاصله از بالا
        left: 16,
        right: 16,
        child: DelayedWidget(animation: DelayedAnimations.SLIDE_FROM_RIGHT,delayDuration: Duration(milliseconds:500),
          child: SafeArea(
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // بلور کردن پس‌زمینه
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3), // پس‌زمینه‌ی شفاف تیره
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message,
                      textAlign: TextAlign.start,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // حذف خودکار بعد از 3 ثانیه
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}

// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AppHelperFunctions {
//   static void showSnackBar(String message) {
//     final context = Get.context!;
//     final overlay = Overlay.of(context);
//     final overlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         top: MediaQuery.of(context).padding.top + 10, // فاصله از بالای صفحه
//         left: 0,
//         right: 0,
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12), // گرد کردن گوشه‌ها
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // بلور کردن پس‌زمینه
//                 child: Container(
//                   width: double.infinity,
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.7), // پس‌زمینه‌ی شفاف تیره
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Text(
//                     message,
//                     textAlign: TextAlign.end,
//                     style: const TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//
//     overlay.insert(overlayEntry);
//
//     // حذف `SnackBar` بعد از 3 ثانیه
//     Future.delayed(const Duration(seconds: 3), () {
//       overlayEntry.remove();
//     });
//   }
// }
