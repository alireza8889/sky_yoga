import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/gen/assets.gen.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/profile_screen/subscription_screen/message_payment.dart';
import 'package:skyyoga/screens/profile_screen/subscription_screen/widget/list_transaction_widget.dart';
import 'package:skyyoga/screens/profile_screen/subscription_screen/widget/widgets.dart';
import 'package:skyyoga/widget/main_app_bar.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscriptionPayment extends StatefulWidget {
  const SubscriptionPayment({super.key});

  @override
  State<SubscriptionPayment> createState() => _SubscriptionPaymentState();
}

class _SubscriptionPaymentState extends State<SubscriptionPayment> {
  final List<String> items = [
    'Item1',
  ];
  String dropdownValue = 'Item1';

  int selectedIndex = 0;
  bool changeToActiveMode = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBarSubscription(
          title: AppString.titleSubscription,
          iconMore: false,
        ),
        body: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: BackGroundColor(),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    size.width * 0.06,
                    size.height * 0.02,
                    size.width * 0.06,
                    0,
                  ),
                  child: SizedBox(
                    height: size.height * 0.85,
                    child: !changeToActiveMode
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                spacing: size.height * 0.03,
                                children: [
                                  // Selected Plan Widget
                                  Column(
                                    spacing: size.height * 0.02,
                                    children: [
                                      SizedBox(
                                        child: AutoSizeText(
                                          AppString
                                              .titlePlanToContinueSubscription,
                                          style: AppTextStyle
                                              .titlePlanToContinueTextStyle,
                                          minFontSize: 9,
                                          maxLines: 2,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        spacing: size.width * 0.02,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = 1;
                                              });
                                            },
                                            child: PlanPaymentiWdget(
                                              size: size,
                                              title: 'Pay Monthly',
                                              text: '20 / Month',
                                              isOff: false,
                                              isActive: selectedIndex == 1,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = 2;
                                              });
                                            },
                                            child: PlanPaymentiWdget(
                                              size: size,
                                              title: 'Pay Annual',
                                              text: '16 / Month',
                                              isOff: true,
                                              priceOff: 'Save 15%',
                                              isActive: selectedIndex == 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  selectedIndex != 0
                                      ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              changeToActiveMode = true;
                                            });
                                          },
                                          child: SizedBox(
                                            child: Column(
                                              spacing: size.height * 0.01,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      AppString
                                                          .serviceSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle,
                                                    ),
                                                    Text(
                                                      AppString
                                                          .serviceSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle
                                                          .apply(
                                                              color: Color(
                                                                  0xff000000),
                                                              fontSizeFactor:
                                                                  1.05),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      AppString
                                                          .customerNumberSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle,
                                                    ),
                                                    Text(
                                                      AppString
                                                          .serviceSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle
                                                          .apply(
                                                              color: Color(
                                                                  0xff000000),
                                                              fontSizeFactor:
                                                                  1.05),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      AppString
                                                          .amountSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle,
                                                    ),
                                                    Text(
                                                      AppString
                                                          .serviceSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle
                                                          .apply(
                                                              color: Color(
                                                                  0xff000000),
                                                              fontSizeFactor:
                                                                  1.05),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      AppString
                                                          .comissionSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle,
                                                    ),
                                                    Text(
                                                      AppString
                                                          .serviceSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle
                                                          .apply(
                                                              color: Color(
                                                                  0xff000000),
                                                              fontSizeFactor:
                                                                  1.05),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      AppString
                                                          .totalSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle,
                                                    ),
                                                    Text(
                                                      AppString
                                                          .serviceSubscription,
                                                      style: AppTextStyle
                                                          .servicesTextStyle
                                                          .apply(
                                                              color: Color(
                                                                  0xff000000),
                                                              fontSizeFactor:
                                                                  1.05),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : SizedBox()
                                ],
                              ),
                              Column(
                                spacing: size.height * 0.1,
                                children: [
                                  // Select Payment Empty Widget
                                  selectedIndex == 0
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                AppString
                                                    .allTransactionSubscription,
                                                style: AppTextStyle
                                                    .titlePlanToContinueTextStyle,
                                              ),
                                            ),
                                            SvgPicture.asset(
                                                Assets.img.svg.noTranascion)
                                          ],
                                        )
                                      : SizedBox(),
                                  ElevatedButton(
                                    onPressed: selectedIndex != 0
                                        ? () {
                                            navigatePushWithFadeTransition(
                                              context,
                                              MessagePaymentScreen(),
                                            );
                                          }
                                        : null,
                                    style: ButtonStyle(
                                      minimumSize: WidgetStatePropertyAll(
                                        Size(
                                          size.width * 0.9,
                                          size.height * 0.06,
                                        ),
                                      ),
                                      shape: WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      backgroundColor: WidgetStatePropertyAll(
                                        selectedIndex != 0
                                            ? AppWidgetColor.activeBotton
                                            : AppWidgetColor.unactiveBotton,
                                      ),
                                    ),
                                    child: AutoSizeText(
                                      AppString.pay,
                                      style: AppTextStyle.bottonSubmitTextStyle,
                                      minFontSize: 8,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                spacing: size.height * 0.02,
                                children: [
                                  Column(
                                    spacing: size.height * 0.02,
                                    children: [
                                      AlarmMessageWidget(
                                          size: size, changeMessage: 0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          AutoSizeText(
                                            AppString.showDateSubscription,
                                            style: AppTextStyle
                                                .showSubscriptionDateTextStyle,
                                            minFontSize: 8,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          AutoSizeText(
                                            '3/8/2025',
                                            style: AppTextStyle
                                                .showSubscriptionDateTextStyle,
                                            minFontSize: 8,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Column(
                                      spacing: size.height * 0.02,
                                      children: [
                                        Column(
                                          spacing: size.height * 0.02,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              spacing: size.width * 0.02,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedIndex = 1;
                                                    });
                                                  },
                                                  child: PlanPaymentiWdget(
                                                    size: size,
                                                    title: 'Pay Monthly',
                                                    text: '20 / Month',
                                                    isOff: false,
                                                    isActive:
                                                        selectedIndex == 1,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      selectedIndex = 2;
                                                    });
                                                  },
                                                  child: PlanPaymentiWdget(
                                                    size: size,
                                                    title: 'Pay Annual',
                                                    text: '16 / Month',
                                                    isOff: true,
                                                    priceOff: 'Save 15%',
                                                    isActive:
                                                        selectedIndex == 2,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  AppString
                                                      .titleTransactionsSubscription,
                                                  style: AppTextStyle
                                                      .titleTransactionsTextStyle,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: size.height * 0.47,
                                              width: double.infinity,
                                              child: ListView.builder(
                                                itemCount: 2,
                                                itemBuilder: (context, index) {
                                                  return ListTransactionWidget(
                                                    size: size,
                                                    selectedIndex:
                                                        selectedIndex,
                                                    index: index,
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: selectedIndex != 0
                                    ? () async {
                                        const url = 'https://www.google.com';
                                        try {
                                          if (await canLaunchUrl(
                                              Uri.parse(url))) {
                                            await launchUrl(Uri.parse(url),
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Could not launch $url')),
                                            );
                                          }
                                        } catch (e) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Error launching $url: $e')),
                                          );
                                        }
                                      }
                                    : null,
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
                                    selectedIndex != 0
                                        ? AppWidgetColor.activeBotton
                                        : AppWidgetColor.unactiveBotton,
                                  ),
                                ),
                                child: AutoSizeText(
                                  AppString.updateBottomSubscription,
                                  style: AppTextStyle.bottonSubmitTextStyle,
                                  minFontSize: 8,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
