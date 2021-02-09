import 'package:flutter/material.dart';
import 'package:sot_cooking/tools/timer.dart';
import 'package:flutter/services.dart';
import 'package:sot_cooking/data/foodData.dart';

class TimerTile extends StatefulWidget {
  final int index;
  TimerTile(this.index)

  @override
  _TimerTileState createState() => _TimerTileState();
}

class _TimerTileState extends State<TimerTile> {
  final timer = new TimerTool();
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
                value: timer.progress,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.lightGreenAccent),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.adjust_outlined),
            title: Text("Fish"),
            onTap: () => {HapticFeedback.mediumImpact(), timer.startTimer(foodData[widget.index].duration)},
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
    );
  }
}
