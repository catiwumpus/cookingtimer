import 'dart:core';
import 'package:flutter/material.dart';
import 'package:sot_cooking/models/foodType.dart';
import 'package:sot_cooking/tools/audio.dart';
import 'package:sot_cooking/tools/notification.dart';
import 'package:vibration/vibration.dart';
import 'dart:async';

class FoodModel extends ChangeNotifier {
  List<FoodType> foodData = []
    ..add(FoodType(
        name: "Fish",
        duration: 40,
        image: AssetImage("assets/Fish_Ruby_SplashTail.png"),
        progress: 0.0,
        activeTimer: false))
    ..add(FoodType(
        name: "Trophy Fish",
        duration: 90,
        image: AssetImage("assets/Fish_Almond_AncientScale.png"),
        progress: 0.0,
        activeTimer: false))
    ..add(FoodType(
        name: "Meat",
        duration: 60,
        image: AssetImage("assets/Food_Bacon.png"),
        progress: 0.0,
        activeTimer: false))
    ..add(FoodType(
        name: "Kraken/Meg",
        duration: 120,
        image: AssetImage("assets/Kraken_Meat.png"),
        progress: 0.0,
        activeTimer: false));

  void startTimer(FoodType foodType) {
    print(foodType.activeTimer);
    new Timer.periodic(
      Duration(milliseconds: 1),
      (Timer timer) {
        foodType.progress =
            ((timer.tick / 1000) / foodType.duration).toDouble();
        foodType.activeTimer = true;
        notifyListeners();
        if (foodType.progress >= 1) {
          timer.cancel();
          AudioTool().playLocalAsset();
          Vibration.vibrate(duration: 1000);
          NotificationTool().showNotification(foodType.name);
          foodType.progress = 0.0;
          foodType.activeTimer = false;
          notifyListeners();
        }
      },
    );
  }
}
