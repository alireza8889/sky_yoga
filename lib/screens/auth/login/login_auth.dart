import 'package:flutter/material.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/login_screen.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/auth/signup/signup_auth.dart';

class AuthLoginScreen extends StatelessWidget {
  const AuthLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppWidgetColor.bgColorAuth,
        body: Stack(
          children: [
            Positioned.fill(
              child: BackGroundColor(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.04,
                right: size.width * 0.05,
                left: size.width * 0.05,
                bottom: size.height * 0.04,
              ),
              child: Column(
                spacing: size.height * 0.01,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppBarText(size: size),
                  Shapelogo(size: size),
                  Column(
                    spacing: size.height * 0.03,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: size.width * 0.02,
                        children: [
                          AccountAutoAuthentication(
                            size: size,
                            svg: Assets.img.svg.googleIcon,
                          ),
                          AccountAutoAuthentication(
                            size: size,
                            svg: Assets.img.svg.appleIcon,
                          ),
                          AccountAutoAuthentication(
                            size: size,
                            svg: Assets.img.svg.faceBookIcon,
                          ),
                        ],
                      ),
                      BottomAuth(
                        size: size,
                        text: AppString.textBottomLoginAuth,
                        child: LoginScreen(),
                      ),
                      BottomLoginOrSignUp(
                        size: size,
                        descriptionText: AppString.textCreateAccountAuth,
                        loginOrSignUpText: AppString.textBottomSignUpAuth,
                        child: AuthSignUpScreen(),
                      ),
                      SecurityTextWidget(size: size),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
