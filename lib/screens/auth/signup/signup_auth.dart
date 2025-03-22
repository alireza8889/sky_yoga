import 'package:flutter/material.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/login_auth.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/auth/signup/signup_screen.dart';

class AuthSignUpScreen extends StatelessWidget {
  const AuthSignUpScreen({super.key});

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
                        text: AppString.bottomSignUpAuth,
                        child: SignupScreen(),
                      ),
                      BottomLoginOrSignUp(
                        size: size,
                        descriptionText: AppString.textLoginAccountAuth,
                        loginOrSignUpText: AppString.login,
                        child: AuthLoginScreen(),
                      ),
                      SecurityTextWidget(size: size)
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
