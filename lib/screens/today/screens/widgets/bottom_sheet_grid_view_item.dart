import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/res/colors.dart';

class BottomSheetGridViewItem extends StatelessWidget {
  final String imagePath;
  final String label;
  RxBool isSelected;

  BottomSheetGridViewItem(
      {super.key, required this.imagePath, required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              // color: Colors.orange,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Expanded(flex: 3,child: Container(
                  decoration:
                  BoxDecoration(
                    color: AppWidgetColor.todayBottomSheetGridItem,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                ),),

                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    )
                    ,
                    child: Center(
                      child: AutoSizeText(

                        label,
                        minFontSize: 6,
                        style: AppTextStyle.todayScreenBottomGridviewText,
                      ),
                    ),
                  ),)

              ],
            ),
          ),
          Obx(() {
            if(isSelected.value==false){
              return SizedBox();
            }
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.4),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),

              ),
            );
          })
        ]
    );
  }
}
