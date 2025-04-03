import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/widget/main_app_bar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: BackGroundColor(),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                right: size.width * 0.04,
                left: size.width * 0.04,
              ),
              child: Column(
                spacing: size.height * 0.02,
                children: [
                  MainAppBar(
                    size: size,
                    isback: true,
                    text: AppString.language,
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: size.height * 0.06,
                    ),
                    decoration: BoxDecoration(
                      color: AppWidgetColor.bgSelectedChoose,
                      border: Border.all(
                          color: AppWidgetColor.borderSelectedChoose),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.05,
                        right: size.width * 0.05,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          AppString.english,
                          style:
                              AppTextStyle.onboardingChooseIndexTextStyle.apply(
                            fontWeightDelta: 2,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: size.width * 0.06,
              left: size.width * 0.06,
              bottom: size.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(
                      size.width * 0.9,
                      size.height * 0.06,
                    ),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  backgroundColor: WidgetStatePropertyAll(
                    AppWidgetColor.activeBotton,
                  ),
                ),
                child: AutoSizeText(
                  AppString.ok,
                  style: AppTextStyle.bottonSubmitTextStyle,
                  minFontSize: 8,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
