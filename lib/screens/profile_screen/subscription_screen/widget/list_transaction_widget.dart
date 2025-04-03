// ignore: must_be_immutable
import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_accordion/custom_accordion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/string.dart';

// ignore: must_be_immutable
class ListTransactionWidget extends StatelessWidget {
  ListTransactionWidget({
    super.key,
    required this.size,
    required this.selectedIndex,
    required this.index,
  });

  final Size size;
  final int selectedIndex;
  int index;
  final flutterMediaDownloaderPlugin = MediaDownload();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAccordion(
          backgroundColor: Colors.transparent,
          title: '1645151021215',
          headerBackgroundColor: Colors.transparent,
          titleStyle: AppTextStyle.titleAllTransactionsTextStyle.apply(
            color: index % 2 == 1
                ? Color(0xffBA1A1A)
                : Color(
                    0xff095028,
                  ),
          ),
          toggleIconOpen: Iconsax.arrow_left_2,
          toggleIconClose: Iconsax.arrow_down_14,
          headerIconColor: Colors.black,
          accordionElevation: 0,
          widgetItems: Column(
            spacing: size.height * 0.01,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.serviceSubscription,
                    style: AppTextStyle.servicesTextStyle,
                  ),
                  Text(
                    AppString.serviceSubscription,
                    style: AppTextStyle.servicesTextStyle
                        .apply(color: Color(0xff000000), fontSizeFactor: 1.05),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.customerNumberSubscription,
                    style: AppTextStyle.servicesTextStyle,
                  ),
                  Text(
                    AppString.serviceSubscription,
                    style: AppTextStyle.servicesTextStyle
                        .apply(color: Color(0xff000000), fontSizeFactor: 1.05),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.amountSubscription,
                    style: AppTextStyle.servicesTextStyle,
                  ),
                  Text(
                    AppString.serviceSubscription,
                    style: AppTextStyle.servicesTextStyle
                        .apply(color: Color(0xff000000), fontSizeFactor: 1.05),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.comissionSubscription,
                    style: AppTextStyle.servicesTextStyle,
                  ),
                  Text(
                    AppString.serviceSubscription,
                    style: AppTextStyle.servicesTextStyle
                        .apply(color: Color(0xff000000), fontSizeFactor: 1.05),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.totalSubscription,
                    style: AppTextStyle.servicesTextStyle,
                  ),
                  Text(
                    AppString.serviceSubscription,
                    style: AppTextStyle.servicesTextStyle
                        .apply(color: Color(0xff000000), fontSizeFactor: 1.05),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              ElevatedButton(
                onPressed: selectedIndex != 0
                    ? () {
                        flutterMediaDownloaderPlugin.downloadMedia(context,
                            'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf');
                      }
                    : null,
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(
                    Size(
                      size.width * 0.9,
                      size.height * 0.06,
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                  backgroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.grey.shade300.withOpacity(0.5);
                      }
                      return Colors.transparent;
                    },
                  ),
                  foregroundColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.disabled)) {
                        return Colors.grey;
                      }
                      return Colors.black;
                    },
                  ),
                  overlayColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        // ignore: deprecated_member_use
                        return Colors.grey.withOpacity(0.2);
                      }
                      return Colors.transparent;
                    },
                  ),
                  elevation: WidgetStateProperty.all(0),
                ),
                child: AutoSizeText(
                  AppString.downloadPDFSubscription,
                  style: AppTextStyle.bottonSubmitTextStyle
                      .apply(color: Colors.black),
                  minFontSize: 8,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: size.width * 0.02, left: size.width * 0.02),
          child: Divider(
            color: Color(0x25111111),
          ),
        )
      ],
    );
  }
}
