import 'dart:async';
import 'package:vibration/vibration.dart';
import 'audio.dart';
import 'notification.dart';

class TimerTool {
  double progress = 0.0;

  double startTimer(double duration) {
    new Timer.periodic(
      Duration(milliseconds: 1),
          (Timer timer) {
          progress = ((timer.tick / 1000) / duration).toDouble();
          if (progress >= 1) {
            timer.cancel();
            AudioTool().playLocalAsset();
            Vibration.vibrate(duration: 1000);
            NotificationTool().showNotification();
            progress = 0.0;
          }
        },
      );
    return progress;
  }
}