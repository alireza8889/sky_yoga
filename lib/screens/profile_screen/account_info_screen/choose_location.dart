import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';
import 'package:skyyoga/res/string.dart';
import 'package:skyyoga/screens/auth/login/widget/widget.dart';
import 'package:skyyoga/widget/main_app_bar.dart';

class ChooseLocationScreen extends StatelessWidget {
  ChooseLocationScreen({super.key});
  final List<String> locations = [
    'England',
    'Englewood',
    'Engen,germany',
  ];

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
                  children: [
                    MainAppBar(
                      size: size,
                      isback: true,
                      text: AppString.location,
                    ),
                    Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        }
                        return locations.where(
                          (location) => location.toLowerCase().contains(
                                textEditingValue.text.toLowerCase(),
                              ),
                        );
                      },
                      onSelected: (String selection) {},
                      fieldViewBuilder:
                          (context, controller, focusNode, onFieldSubmitted) {
                        return TextField(
                          cursorColor: Colors.black,
                          style: AppTextStyle.chooseLocationTextStyle,
                          controller: controller,
                          focusNode: focusNode,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: AppWidgetColor.borderColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                              borderSide: BorderSide(
                                color: AppWidgetColor.borderColor,
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: size.width * 0.05),
                              child: Icon(Iconsax.search_normal),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        );
                      },
                      optionsViewBuilder: (context, onSelected, options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: size.height * 0.5,
                              maxWidth: size.width * 0.9,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: options.length,
                              itemBuilder: (context, index) {
                                final option = options.elementAt(index);
                                return InkWell(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: index == 0
                                            ? size.height * 0.02
                                            : size.height * 0.01,
                                        right: size.width * 0.02),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxHeight: size.height * 0.07,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: AppWidgetColor.borderColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: SizedBox(
                                        height: double.infinity,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                            right: size.width * 0.04,
                                            left: size.width * 0.04,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                spacing: size.width * 0.02,
                                                children: [
                                                  AutoSizeText(
                                                    option,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppTextStyle
                                                        .titleProfileBottonVerticlaTextStyle
                                                        .apply(
                                                            fontSizeFactor:
                                                                1.05),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
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
