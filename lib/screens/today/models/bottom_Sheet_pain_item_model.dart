import 'package:get/get_rx/src/rx_types/rx_types.dart';

class PainGridItemModel{
  final String imagePath;
  final String label;
  RxBool isSelected;
  PainGridItemModel({required this.isSelected,required this.label,required this.imagePath,});

}