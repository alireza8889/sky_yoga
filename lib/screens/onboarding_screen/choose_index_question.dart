import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/profile_controller/profile_controller.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/screens/main_screen/main_screen.dart';
import 'package:skyyoga/screens/onboarding_screen/choose_front_or_back.dart';
import 'package:skyyoga/screens/onboarding_screen/widget/selected_box_question.dart';

class ChooseIndexQuestion extends StatefulWidget {
  const ChooseIndexQuestion(
      {super.key, required this.username, required this.gender});
  final String username;
  final String gender;

  @override
  State<ChooseIndexQuestion> createState() => _ChooseIndexQuestionState();
}

class _ChooseIndexQuestionState extends State<ChooseIndexQuestion> {
  final controller = Get.put(ProfileController());

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

  List<String> selectedItem = [];
  List<String> yesNoQuestion = [
    'Yes, I could some extra care',
    'Nope, feeling all good',
  ];
  bool isButtonEnabled = false;
  int? selectedIndex;

  void checkButtonStatus() async {
    setState(() {
      isButtonEnabled = selectedItem.isNotEmpty && selectedIndex != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            BackGroundColor(),
            SingleChildScrollView(
              child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.01,
                        right: size.width * 0.05,
                        left: size.width * 0.05,
                        bottom: size.height * 0.04,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppBarAuthentication(
                                size: size,
                                isback: true,
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      spacing: size.height * 0.02,
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${AppString.welcomeTextOnboarding} ${widget.username}',
                                            style: AppTextStyle
                                                .onboardingWelcomeTextStyle,
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: AutoSizeText(
                                                AppString.titleOnboarding,
                                                style: AppTextStyle.mainTitle,
                                                minFontSize: 16,
                                                maxLines: 2,
                                              ),
                                            ),
                                            for (var i in filings.keys)
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (selectedItem
                                                        .contains(i)) {
                                                      selectedItem.remove(i);
                                                    } else {
                                                      selectedItem
                                                          .add(i.toString());
                                                    }
                                                    checkButtonStatus();
                                                  });
                                                },
                                                child: MultiBoxSelected(
                                                    size: size,
                                                    selectedItem: selectedItem,
                                                    filings: filings,
                                                    i: i),
                                              ),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AutoSizeText(
                                            AppString.title2Onboarding,
                                            style: AppTextStyle.mainTitle,
                                            minFontSize: 16,
                                            maxLines: 3,
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: AutoSizeText(
                                            AppString.description2Onboarding,
                                            style: AppTextStyle.descreptionAuth,
                                            maxLines: 2,
                                            minFontSize: 8,
                                          ),
                                        ),
                                        for (var i = 0;
                                            i < yesNoQuestion.length;
                                            i++)
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedIndex = i;
                                                checkButtonStatus();
                                              });
                                            },
                                            child: SoloBoxSelected(
                                              size: size,
                                              text: yesNoQuestion[i],
                                              selectedItem: selectedItem,
                                              filings: yesNoQuestion,
                                              index: 0,
                                              isActive: selectedIndex == i
                                                  ? true
                                                  : false,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Positioned(
              right: size.width * 0.04,
              left: size.width * 0.04,
              bottom: size.height * 0.03,
              child: Obx(
                () => ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          setState(
                            () {
                              controller.updateProfile(
                                index: selectedIndex!,
                                context: context,
                                gender: widget.gender,
                                name: widget.username,
                                mainFocuses: selectedItem,
                                page: selectedIndex == 1
                                    ? MainScreen()
                                    : ChooseFrontOrBack(),
                              );
                            },
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
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    backgroundColor: WidgetStatePropertyAll(
                      isButtonEnabled
                          ? AppWidgetColor.activeBotton
                          : AppWidgetColor.unactiveBotton,
                    ),
                  ),
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : AutoSizeText(
                          AppString.bottonOnboarding,
                          style: AppTextStyle.bottonSubmitTextStyle,
                          minFontSize: 8,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
