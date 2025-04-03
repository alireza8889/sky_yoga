import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';

class MessagePaymentScreen extends StatefulWidget {
  const MessagePaymentScreen({super.key});

  @override
  State<MessagePaymentScreen> createState() => _MessagePaymentScreenState();
}

class _MessagePaymentScreenState extends State<MessagePaymentScreen> {
  bool selectedIndex = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: BackGroundColor(),
            ),
            Positioned(
              top: size.height * 0.02,
              right: 0,
              left: 0,
              bottom: size.height * 0.04,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  Column(
                    spacing: size.height * 0.02,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = !selectedIndex;
                          });
                        },
                        child: SvgPicture.asset(
                          selectedIndex
                              ? Assets.img.svg.successIcon
                              : Assets.img.svg.failIcon,
                          height: size.width * 0.4,
                          width: size.width * 0.4,
                        ),
                      ),
                      Text(
                        selectedIndex
                            ? AppString.paymentSuccessfullySubscription
                            : AppString.paymentFailedSubscription,
                        style: AppTextStyle.titlePaymentMessage,
                      )
                    ],
                  ),
                  ElevatedButton(
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
                      backgroundColor:
                          WidgetStatePropertyAll(AppWidgetColor.activeBotton),
                    ),
                    child: AutoSizeText(
                      AppString.backToApplication,
                      style: AppTextStyle.bottonSubmitTextStyle,
                      minFontSize: 8,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
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
