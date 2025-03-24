import 'package:get/get.dart';

class HelpQuestionOptionModel{

  final String videoId;
  final String thumbnail;
  RxBool isSelected;
  HelpQuestionOptionModel({required this.thumbnail,required this.videoId,required this.isSelected});



  factory HelpQuestionOptionModel.fromJson(Map<String, dynamic> json) {
    final data = json;
    return HelpQuestionOptionModel(
      isSelected: false.obs,
        videoId: data['video_id'] ?? '',
        thumbnail: data['thumbnail'] ?? '',
 );
  }

}