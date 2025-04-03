import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PainAreaModel{

  final String imageUrl;
  final int id;
  final String label;
  RxBool isSelected;
  PainAreaModel({required this.id, required this.isSelected,required this.label,required this.imageUrl});



  factory PainAreaModel.fromJson(Map<String, dynamic> json) {
    final data = json;
    return PainAreaModel(
      isSelected:false.obs,
      label: json['name']??'',
      imageUrl: json['thumbnail']??'',
      id:  json['id']??'',
    );
  }
}