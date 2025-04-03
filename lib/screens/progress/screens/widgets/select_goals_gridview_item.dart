import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:skyyoga/components/text_style.dart';

class SelectGoalsGridviewItem extends StatelessWidget {
  final String imageUrl; // Add a parameter to accept the image path
  final String title;
  final RxBool isSelected;

  const SelectGoalsGridviewItem({super.key,
    required this.imageUrl, // Make imagePath required
    required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(children: [
        Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: CachedNetworkImage(
                    width: double.infinity,
                    imageUrl: imageUrl,
                    fit: BoxFit.fill, // Cover the entire container
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8,vertical: 3),
                    width: double.infinity,
                    color: Colors.orange,
                    child: Center(
                      child: AutoSizeText(
                        minFontSize: 6,
                        title,
                      style: AppTextStyle.selectGoalsItemTilteStyle,
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
        Obx(() {
          if(isSelected.value==true){
            return Container(
              decoration: BoxDecoration(

                border: Border.all(width: 3,color: Colors.blue),
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.withOpacity(0.2),

              ),
            );
          }else{
           return SizedBox();
          }

        })
      ]),
    );
  }
}
