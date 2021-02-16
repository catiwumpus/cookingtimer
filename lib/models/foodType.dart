import 'package:flutter/material.dart';

class FoodType {
  String name;
  double duration;
  AssetImage image;
  double progress;
  bool activeTimer;

  FoodType({this.duration, this.name, this.image, this.progress, this.activeTimer});
}
