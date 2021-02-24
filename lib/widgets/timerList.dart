import 'package:google_fonts/google_fonts.dart';
import 'package:sot_cooking/models/foodType.dart';
import 'package:sot_cooking/widgets/timerTile.dart';
import 'package:flutter/material.dart';

class TimerList extends StatelessWidget {
  final List<FoodType> foodType;

  TimerList({@required this.foodType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50,),
        Text("What's on the menu, Matey", style: GoogleFonts.pirataOne(fontSize: 25, color: Colors.white)),
        ListView(
          shrinkWrap: true,
          children: getChildren(),
        ),
      ],
    );
  }

  List<Widget> getChildren() {
    return foodType.map((e) => TimerTile(foodType: e,)).toList();
  }
}