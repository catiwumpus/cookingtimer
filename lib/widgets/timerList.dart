import 'package:sot_cooking/models/foodType.dart';
import 'package:sot_cooking/widgets/timerTile.dart';
import 'package:flutter/material.dart';

class TimerList extends StatelessWidget {
  final List<FoodType> foodType;

  TimerList({@required this.foodType});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildren(),
    );
  }

  List<Widget> getChildren() {
    return foodType.map((e) => TimerTile(foodType: e,)).toList();
  }
}