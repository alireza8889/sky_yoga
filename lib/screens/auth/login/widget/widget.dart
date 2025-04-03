import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/profile_screen/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class AccountAutoAuthentication extends StatelessWidget {
  const AccountAutoAuthentication({
    super.key,
    required this.size,
    required this.svg,
  });

  final Size size;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: size.width * 0.27,
        maxHeight: size.width * 0.15,
      ),
      decoration: BoxDecoration(
        color: AppWidgetColor.bgColorAuth,
        borderRadius: BorderRadius.circular(
          16,
        ),
        border: Border.all(
          color: AppWidgetColor.borderColor,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          svg,
          height: size.width * 0.1,
        ),
      ),
    );
  }
}

class AppBarText extends StatelessWidget {
  const AppBarText({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        spacing: size.height * 0.005,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                AppString.titleAuth,
                style: AppTextStyle.mainTitle,
                minFontSize: 12,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              TextButton(
                onPressed: () {},
                child: AutoSizeText(
                  AppString.skipBottonAuth,
                  style: AppTextStyle.skipBottonAuth,
                  minFontSize: 8,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          AutoSizeText(
            AppString.descriptionAuth,
            style: AppTextStyle.descreptionAuth,
            minFontSize: 8,
          ),
        ],
      ),
    );
  }
}

class Shapelogo extends StatelessWidget {
  const Shapelogo({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.img.svg.shape,
      width: size.width * 0.75,
      height: size.height * 0.23,
    );
  }
}

class BottomAuth extends StatelessWidget {
  const BottomAuth({
    super.key,
    required this.size,
    required this.text,
    required this.child,
  });

  final Size size;
  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatePushWithFadeTransition(context, child);
      },
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppWidgetColor.bgBottomAuth,
        ),
        child: Center(
          child: Row(
            spacing: size.width * 0.01,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.img.svg.mail),
              AutoSizeText(
                text,
                style: AppTextStyle.textBottonAuth,
                minFontSize: 8,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomLoginOrSignUp extends StatelessWidget {
  const BottomLoginOrSignUp({
    super.key,
    required this.size,
    required this.descriptionText,
    required this.loginOrSignUpText,
    required this.child,
  });

  final Size size;
  final String descriptionText;
  final String loginOrSignUpText;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatePushReplacementWithFadeTransition(context, child);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: size.width * 0.02,
        children: [
          AutoSizeText(
            descriptionText,
            style: AppTextStyle.accountLoginSignUpAuth,
            minFontSize: 7,
            overflow: TextOverflow.ellipsis,
          ),
          AutoSizeText(
            loginOrSignUpText,
            style: AppTextStyle.loginOrSignUpAuth,
            minFontSize: 7,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class BackGroundColor extends StatelessWidget {
  const BackGroundColor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppWidgetColor.bgColorAuthScreen,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class FieldInputText extends StatelessWidget {
  const FieldInputText({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hintStyle,
    required this.size,
    required this.textError,
  });

  final TextEditingController controller;
  final String hintText;
  final TextStyle hintStyle;
  final Size size;
  final textError;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.02),
      child: Column(
        spacing: size.height * 0.01,
        children: [
          TextField(
            controller: controller,
            style: AppTextStyle.textFieldInputAuth,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppWidgetColor.borderSideTextFieldAuth,
                ),
              ),
            ),
          ),
          textError != null
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
                    textError,
                    style: AppTextStyle.errorTextStyle,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}

class AppBarAuthentication extends StatelessWidget {
  const AppBarAuthentication({
    super.key,
    required this.size,
    required this.isback,
  });

  final Size size;

  final bool isback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            width: size.width * 0.15,
            height: size.height * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isback
                    ? SvgPicture.asset(
                        Assets.img.svg.arrowLeft,
                        // ignore: deprecated_member_use
                        color: Colors.black,
                      )
                    : SizedBox(
                        width: size.width * 0.15,
                      ),
              ],
            ),
          ),
        ),
        Center(
          child: AutoSizeText(
            AppString.appBarText,
            style: AppTextStyle.appBarAuth,
            minFontSize: 12,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          width: size.width * 0.15,
        ),
      ],
    );
  }
}

class AuthTextWidget extends StatelessWidget {
  const AuthTextWidget({
    super.key,
    required this.size,
    required this.title,
    required this.description,
  });

  final Size size;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.02),
      child: Column(
        spacing: size.height * 0.01,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              title,
              style: AppTextStyle.mainTitle,
              minFontSize: 12,
              maxLines: 1,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              description,
              style: AppTextStyle.descreptionAuth,
              minFontSize: 8,
            ),
          )
        ],
      ),
    );
  }
}

class SecurityTextWidget extends StatelessWidget {
  const SecurityTextWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PrivacyPolicyScreen(),
        ),
      ),
      child: SizedBox(
        height: size.height * 0.06,
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: AppString.securityText1,
            style: AppTextStyle.accountLoginSignUpAuth,
            children: <InlineSpan>[
              TextSpan(
                text: AppString.securityText2,
                style: AppTextStyle.loginOrSignUpAuth,
              ),
              TextSpan(
                text: AppString.securityText3,
                style: AppTextStyle.accountLoginSignUpAuth,
              ),
              TextSpan(
                text: AppString.securityText4,
                style: AppTextStyle.loginOrSignUpAuth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
