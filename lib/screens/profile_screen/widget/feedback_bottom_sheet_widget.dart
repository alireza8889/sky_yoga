import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';

class FeedBackBottomSheetWIdget extends StatelessWidget {
  const FeedBackBottomSheetWIdget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: size.height * 0.5,
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
              top: size.height * 0.04,
              right: size.width * 0.06,
              left: size.width * 0.06,
            ),
            child: Column(
              spacing: size.height * 0.02,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  spacing: size.height * 0.01,
                  children: [
                    AutoSizeText(
                      AppString.title1BottomSheet,
                      style: AppTextStyle.titleBottomSheetTextStyle,
                      minFontSize: 8,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      AppString.title2BottomSheet,
                      style: AppTextStyle.titleBottomSheetTextStyle,
                      minFontSize: 8,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Column(
                  spacing: size.height * 0.05,
                  children: [
                    Container(
                      height: size.height * 0.165,
                      decoration: BoxDecoration(
                        color: AppWidgetColor.textFieldBotomSheetColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(size.width * 0.04),
                        child: TextField(
                          cursorColor: Colors.grey,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            hintText: AppString.lableTextFieldBottomSheet,
                            hintStyle: AppTextStyle.textBottomSheetTextStyle,
                            labelStyle: AppTextStyle.textBottomSheetTextStyle,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.zero,
                          ),
                          style: AppTextStyle.textBottomSheetTextStyle,
                        ),
                      ),
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
                        backgroundColor: WidgetStatePropertyAll(
                          AppWidgetColor.bottomSheetBotton,
                        ),
                      ),
                      child: AutoSizeText(
                        AppString.submit,
                        style: AppTextStyle.bottonSubmitTextStyle,
                        minFontSize: 8,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
