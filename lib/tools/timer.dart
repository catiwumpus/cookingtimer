import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'audio.dart';
import 'notification.dart';

class TimerTool extends ChangeNotifier {
  double _progress = 0.0;

  double get progress => _progress;

  void startTimer(double duration, String foodName) {
    new Timer.periodic(
      Duration(milliseconds: 1),
      (Timer timer) {
        _progress = ((timer.tick / 1000) / duration).toDouble();
        print("THis is my duration: $duration");
        notifyListeners();
        if (_progress >= 1) {
          timer.cancel();
          AudioTool().playLocalAsset();
          Vibration.vibrate(duration: 1000);
          NotificationTool().showNotification(foodName);
          _progress = 0.0;
        }
      },
    );
  }
}
