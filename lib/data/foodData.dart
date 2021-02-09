import 'dart:core';
import 'package:flutter/material.dart';
import 'package:sot_cooking/models/foodType.dart';

List<FoodType> foodData = []
    ..add(FoodType(name: "Fish", duration: 40, image: AssetImage("assets/Fish_Rose_Wrecker.png")))
    ..add(FoodType(name: "Trophy Fish", duration: 90, image: AssetImage("assets/Fish_Rose_Wrecker.png")))
    ..add(FoodType(name: "Meat", duration: 60, image: AssetImage("assets/Food_Bacon.png")))
    ..add(FoodType(name: "Kraken & Meg", duration: 120, image: AssetImage("assets/Kraken_Meat.png")));