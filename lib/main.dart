import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sot_cooking/widgets/timerList.dart';
import 'package:sot_cooking/data/foodData.dart';

void main() {
  runApp(
    ChangeNotifierProvider<FoodModel>(
      create: (_) => new FoodModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoT Cooking Assistant',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(89, 57, 63, 1.0),
          accentColor: Color.fromRGBO(75, 191, 137, 1.0)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<FoodModel>(builder: (context, timer, child) => TimerList(foodType: timer.foodData)),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
