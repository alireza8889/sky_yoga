import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/controller/reminder_controller/reminder_controller.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/profile_screen/models/remider_model.dart';
import 'package:wheel_picker/wheel_picker.dart';

class CreateReminderWidget extends StatefulWidget {
  const CreateReminderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<CreateReminderWidget> createState() => _CreateReminderWidgetState();
}

class _CreateReminderWidgetState extends State<CreateReminderWidget> {
  int selectedHour = 0;
  int selectedMinute = 0;
  String selectedValue = 'AM';
  List<String> selectedDay = [];
  List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  bool _isBottomSheetOpen = true;

  void toggleBottomSheet() {
    setState(() {
      _isBottomSheetOpen = !_isBottomSheetOpen;
    });
  }

  Widget buildPicker(
      int min, int max, int selectedValue, Function(int) onSelected,
      {bool twoDigit = false}) {
    final secondsWheel = WheelPickerController(itemCount: max);
    List<int> values = List.generate(max - min + 1, (index) => min + index);

    return SizedBox(
      width: widget.size.width * 0.15,
      height: widget.size.height * 0.2,
      child: WheelPicker(
        builder: (context, index) {
          int value = values[index];
          return Center(
            child: Text(twoDigit ? value.toString().padLeft(2, '0') : "$value",
                style: AppTextStyle.textTimeBottomSheetTextStyle),
          );
        },
        controller: secondsWheel,
        selectedIndexColor: Colors.white,
        onIndexChanged: (index, interactionType) {
          onSelected(values[index]);
        },
        style: WheelPickerStyle(
          itemExtent: 32,
          diameterRatio: 10,
          surroundingOpacity: .25,
        ),
      ),
    );
  }

  Widget buildPickerWithItems(
    String selectedValue,
  ) {
    return SizedBox(
      width: widget.size.width * 0.15,
      height: widget.size.height * 0.2,
      child: WheelPicker(
        itemCount: 2,
        builder: (context, index) {
          return Center(
            child: Text(["AM", "PM"][index],
                style: AppTextStyle.textTimeBottomSheetTextStyle),
          );
        },
        looping: false,
        style: WheelPickerStyle(
          itemExtent: 32,
          diameterRatio: 10,
          surroundingOpacity: .25,
        ),
      ),
    );
  }

  Widget buildDaySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: days.map((day) {
        bool isSelected = selectedDay.contains(day);
        return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedDay.contains(day)) {
                  selectedDay.remove(day);
                } else {
                  selectedDay.add(day);
                }
              });
            },
            child: Container(
              width: widget.size.width * 0.12,
              height: widget.size.width * 0.09,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromRGBO(255, 255, 255, 0.7)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  day,
                  style: AppTextStyle.daysOfTheWeekBottomSheetTextStyle.apply(
                    color: isSelected ? Color(0xff191D2D) : null,
                  ),
                ),
              ),
            ));
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: StatefulBuilder(
          builder: (context, setState) => Container(
            height: widget.size.height * 0.55,
            decoration: BoxDecoration(
              color: AppWidgetColor.backgroundBotomSheetColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppWidgetColor.shadowBotomSheetColor,
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.size.height * 0.035,
                right: widget.size.width * 0.06,
                left: widget.size.width * 0.06,
                bottom: widget.size.height * 0.02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    spacing: widget.size.height * 0.02,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            AppString.titleTimerReminder,
                            style: AppTextStyle.titleBottomSheetTextStyle,
                            minFontSize: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              right: widget.size.width * 0.22,
                              left: widget.size.width * 0.23,
                            ),
                            height: widget.size.height * 0.035,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 0.05),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildPicker(1, 12, selectedHour, (value) {
                                setState(() => selectedHour = value);
                              }),
                              buildPicker(0, 60, selectedMinute, (value) {
                                setState(() => selectedMinute = value);
                              }, twoDigit: true),
                              buildPickerWithItems(selectedValue)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        spacing: widget.size.height * 0.015,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                AppString.reminder,
                                style: AppTextStyle.titleBottomSheetTextStyle,
                                minFontSize: 8,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          buildDaySelector(),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStatePropertyAll(
                        Size(
                          widget.size.width * 0.9,
                          widget.size.height * 0.06,
                        ),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                        AppWidgetColor.bottomSheetBotton,
                      ),
                    ),
                    child: AutoSizeText(
                      AppString.done,
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
        ),
      ),
    );
  }
}

class ShowReminderWidget extends StatefulWidget {
  const ShowReminderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<ShowReminderWidget> createState() => _ShowReminderWidgetState();
}

class _ShowReminderWidgetState extends State<ShowReminderWidget> {
  final ReminderController reminderController = Get.put(ReminderController());

  bool haveAReminder = true;
  bool light = true;
  late int trashIndex = -1;

  trashToggle() {
    reminderController.getReminders();
    setState(() {});
  }

  @override
  void dispose() {
    reminderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: haveAReminder
                  ? widget.size.height * 0.6
                  : widget.size.height * 0.256,
              decoration: BoxDecoration(
                color: AppWidgetColor.backgroundBotomSheetColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppWidgetColor.shadowBotomSheetColor,
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: widget.size.height * 0.04,
                  right: widget.size.width * 0.06,
                  left: widget.size.width * 0.06,
                  bottom: widget.size.height * 0.03,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                            Get.bottomSheet(
                                    CreateReminderWidget(size: widget.size))
                                .whenComplete(() {
                              Get.bottomSheet(
                                ShowReminderWidget(size: widget.size),
                              );
                            });
                          },
                          child: Container(
                            height: widget.size.height * 0.08,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    AppWidgetColor.borderColorBottomSheetColor,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: widget.size.width * 0.04,
                              ),
                              child: Row(
                                spacing: widget.size.width * 0.02,
                                children: [
                                  Icon(
                                    Iconsax.add,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    AppString.addReminder,
                                    style:
                                        AppTextStyle.titleBottomSheetTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            trashIndex = -1;
                            trashToggle();
                          },
                          child: Obx(
                            () => reminderController.isLoading.value
                                ? SizedBox(
                                    height: widget.size.height * 0.34,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Container(
                                    constraints: BoxConstraints(
                                      maxHeight: widget.size.height * 0.34,
                                    ),
                                    child: ListView.builder(
                                      itemCount:
                                          reminderController.reminders.length,
                                      itemBuilder: (context, index) {
                                        final Reminder reminder =
                                            reminderController.reminders[index];
                                        final String daysString = reminder
                                            .daysOfWeek
                                            .map((dayNum) => reminderController
                                                .getDayName(dayNum))
                                            .join(', ');
                                        final String time24hTo12 =
                                            reminderController.formatTime24to12(
                                                reminder.time);

                                        return Container(
                                          height: widget.size.height * 0.18,
                                          width: double.infinity,
                                          margin: EdgeInsets.only(
                                            top: index == 0
                                                ? widget.size.height * 0.02
                                                : 0,
                                            bottom: widget.size.height * 0.02,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppWidgetColor
                                                  .borderAlarmBottomSheetColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: widget.size.width * 0.02,
                                                  bottom:
                                                      widget.size.height * 0.02,
                                                  right:
                                                      widget.size.width * 0.04,
                                                  left:
                                                      widget.size.width * 0.04),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      AutoSizeText(
                                                        time24hTo12,
                                                        style: AppTextStyle
                                                            .timeSetReminderBottomSheetTextStyle,
                                                        minFontSize: 10,
                                                      ),
                                                      Switch(
                                                        value: reminder.isActive
                                                            ? true
                                                            : false,
                                                        activeTrackColor:
                                                            Color.fromRGBO(
                                                                49, 49, 49, 1),
                                                        activeColor:
                                                            Color(0xff0099AD),
                                                        inactiveThumbColor:
                                                            Colors.white,
                                                        inactiveTrackColor:
                                                            Colors.transparent,
                                                        splashRadius: 0.5,
                                                        onChanged:
                                                            (bool value) {
                                                          setState(() {});
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          spacing: 4,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              'Repeat',
                                                              style: AppTextStyle
                                                                  .subTitleTxetReminderBottomSheetTextStyle,
                                                              minFontSize: 8,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            AutoSizeText(
                                                              daysString,
                                                              style: AppTextStyle
                                                                  .daysOfWeekReminderBottomSheetTextStyle,
                                                              minFontSize: 6,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )
                                                          ],
                                                        ),
                                                        IconButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              if (trashIndex !=
                                                                  index) {
                                                                trashIndex =
                                                                    index;
                                                                trashToggle();
                                                              } else {
                                                                trashIndex = -1;
                                                                trashToggle();
                                                              }
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Iconsax.trash,
                                                            color: AppWidgetColor
                                                                .trashIconBottomSheetColor,
                                                          ),
                                                        ),
                                                      ])
                                                ],
                                              )),
                                        );
                                      },
                                    )),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(
                          Size(
                            widget.size.width * 0.9,
                            widget.size.height * 0.06,
                          ),
                        ),
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        backgroundColor: WidgetStatePropertyAll(
                          AppWidgetColor.bottomSheetBotton,
                        ),
                      ),
                      child: AutoSizeText(
                        AppString.done,
                        style: AppTextStyle.bottonSubmitTextStyle,
                        minFontSize: 8,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
