
import 'package:get/get.dart';

class SelectGoalsItemModel {
  final int id;
  final String title;
  final String videoId;
  final String thumbnail;
  final RxBool isSelected;


  SelectGoalsItemModel(  {required this.id, required this.videoId, required this.thumbnail,required this.title,required this.isSelected });




  factory SelectGoalsItemModel.fromJson(Map<String, dynamic> json) {

    return SelectGoalsItemModel(
      id: json['id'],
      title: json['title'],
      videoId: json['video_id'],
      thumbnail: json['thumbnail']??'',
      isSelected: false.obs,
    );
  }
}