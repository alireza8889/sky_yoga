import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/onboarding_screen/widget/choose_index_gender.dart';
import 'package:skyyoga/screens/onboarding_screen/widget/selected_box_question.dart';
import 'package:skyyoga/screens/profile_screen/account_info_screen/choose_location.dart';
import 'package:skyyoga/widget/main_app_bar.dart';
import 'package:skyyoga/widget/route_page_transaction.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
  int? selectedIndex;
  bool isButtonEnabled = false;
  TextEditingController userNameController = TextEditingController();

  final Map<String, String> filings = {
    "ENJOY_YOGA": "Enjoy yoga and avoid injury",
    "BUILD_STRENGTH": "Build strength and support my posture",
    "CHALLENGE_MYSELF": "Challenge myself and master new poses",
    "FIND_CALM": "Find calm and relaxation",
  };

  List<String> selectedValues = [];

  void toggleSelection(String value) {
    setState(() {
      if (selectedValues.contains(value)) {
        selectedValues.remove(value);
      } else {
        selectedValues.add(value);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    userNameController.addListener(checkButtonStatus);
  }

  @override
  void dispose() {
    userNameController.removeListener(checkButtonStatus);
    userNameController.dispose();
    super.dispose();
  }

  void checkButtonStatus() {
    setState(
      () {
        isButtonEnabled =
            selectedIndex != null && userNameController.text.trim().isNotEmpty;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                  right: size.width * 0.06,
                  left: size.width * 0.06,
                ),
                child: Column(
                  spacing: size.height * 0.03,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MainAppBar(
                      size: size,
                      isback: true,
                      text: AppString.titleAccountInfo,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          '${AppString.email}:',
                          style: AppTextStyle.labelTextStyle,
                          minFontSize: 8,
                          overflow: TextOverflow.ellipsis,
                        ),
                        TextField(
                          style: AppTextStyle.textFieldTextStyle,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02),
                          ),
                          readOnly: true,
                          cursorColor: Colors.black,
                          controller: TextEditingController(
                            text: 'Arvinvisi03@gmail.com',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                '${AppString.name}:',
                                style: AppTextStyle.labelTextStyle,
                                minFontSize: 8,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                constraints:
                                    BoxConstraints(maxWidth: size.width * 0.4),
                                child: TextField(
                                  style: AppTextStyle.textFieldTextStyle,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  cursorColor: Colors.black,
                                  controller: TextEditingController(
                                    text: 'Arvin Veysi',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                SlideRightToLeftRoute(
                                  builder: (context) {},
                                  page: ChooseLocationScreen(),
                                ),
                              );
                            },
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: size.width * 0.4,
                                  maxHeight: size.width * 0.175),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AutoSizeText(
                                    '${AppString.location}:',
                                    style: AppTextStyle.labelTextStyle,
                                    minFontSize: 8,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AutoSizeText(
                                        'Not set',
                                        style: AppTextStyle.textFieldTextStyle,
                                        minFontSize: 8,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Transform.rotate(
                                        angle: -90 * (3.141592653589793 / 180),
                                        child: Icon(
                                          Iconsax.arrow_down_1,
                                          size: size.width * 0.04,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 0.78,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.03),
                      child: Column(
                        spacing: size.height * 0.02,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            '${AppString.gender}:',
                            style: AppTextStyle.labelTextStyle,
                            minFontSize: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 0;
                                    checkButtonStatus();
                                  });
                                },
                                child: ChooseIndexGender(
                                  size: size,
                                  text: AppString.chooseMaleOnboarding,
                                  isActive: selectedIndex == 0 ? true : false,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = 1;
                                    checkButtonStatus();
                                  });
                                },
                                child: ChooseIndexGender(
                                  size: size,
                                  text: AppString.chooseFemaleOnboarding,
                                  isActive: selectedIndex == 1 ? true : false,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(
                                    () {
                                      selectedIndex = 2;
                                      checkButtonStatus();
                                    },
                                  );
                                },
                                child: ChooseIndexGender(
                                  size: size,
                                  text: AppString.chooseNonBirnyOnboarding,
                                  isActive: selectedIndex == 2 ? true : false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.01),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              '${AppString.focuseIndex}:',
                              style: AppTextStyle.labelTextStyle,
                              minFontSize: 8,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          for (var i in filings.keys)
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selectedValues.contains(filings[i])) {
                                    selectedValues.remove(filings[i]);
                                  } else {
                                    selectedValues.add(filings[i].toString());
                                  }
                                  checkButtonStatus();
                                });
                              },
                              child: MultiBoxSelected(
                                  size: size,
                                  selectedItem: selectedValues,
                                  filings: filings,
                                  i: i),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
