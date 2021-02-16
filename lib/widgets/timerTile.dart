import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:sot_cooking/data/foodData.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sot_cooking/models/foodType.dart';

class TimerTile extends StatelessWidget {
  final FoodType foodType;
  TimerTile({@required this.foodType});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Stack(
        children: [
          Container(
            height: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: foodType.progress,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).accentColor),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: foodType.image,
            ),
            title: Text(
              foodType.name,
              style: GoogleFonts.pirataOne(),
            ),
            onTap: () => {
              HapticFeedback.mediumImpact(),
              if (!foodType.activeTimer)
                {
                  Provider.of<FoodModel>(context, listen: false)
                      .startTimer(foodType)
                }
            },
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
    );
  }
}
