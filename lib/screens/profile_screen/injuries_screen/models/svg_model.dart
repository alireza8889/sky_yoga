import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SvgModel{
  final double top;
  final double left;
  final double right;
  final double height;
  final int id;
  final String path;
  final String side;
  Rx<Color> color;
  SvgModel( {required this.right,required this.top,required  this.left,required  this.height,required  this.id,required  this.path,required  this.color,required this.side });
}