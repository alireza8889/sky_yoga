import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/privacy_policy_controller/privacy_policy_controller.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/widget/main_app_bar.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final controller = Get.put(PrivacyPolicyController());

  @override
  void initState() {
    controller.getPrivacyPolicy();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: AppString.titlePrivacyPolicy,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: BackGroundColor(),
            ),
            Obx(
              () => controller.isLoadin.value
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          right: size.width * 0.04,
                          left: size.width * 0.04,
                          bottom: size.height * 0.02),
                      child: SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Text(
                            controller.text.value,
                            style: AppTextStyle.textPrivacyPolicyTextStyle,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
