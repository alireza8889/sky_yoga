import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:skyyoga/components/text_style.dart';
import 'package:skyyoga/data/video_fake_data.dart';
import 'package:skyyoga/res/colors.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    super.key,
    required this.size,
    required this.categoryList,
  });

  final Size size;
  final List<CategoryList> categoryList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: size.width * 0.04,
      ),
      constraints: BoxConstraints(
        maxHeight: size.width * 0.08,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: AppWidgetColor.categoryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            margin: EdgeInsets.only(
                left: index == 0 ? size.width * 0.04 : size.width * 0.02,
                right:
                    index == categoryList.length - 1 ? size.width * 0.04 : 0),
            constraints: BoxConstraints(
              minWidth: size.width * 0.2,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: size.width * 0.02,
                left: size.width * 0.02,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: size.width * 0.01,
                  children: [
                    categoryList[index].timer
                        ? Icon(
                            CupertinoIcons.time,
                            size: size.width * 0.04,
                          )
                        : SizedBox(),
                    AutoSizeText(
                      categoryList[index].title,
                      style: AppTextStyle.categoryVideoPlayer,
                      minFontSize: 6,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
