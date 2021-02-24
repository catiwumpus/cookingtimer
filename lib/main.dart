import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sot_cooking/widgets/timerList.dart';
import 'package:sot_cooking/data/foodData.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'dart:io';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          primaryColor: Color.fromRGBO(44, 180, 156, 1.0),
          accentColor: Color.fromRGBO(180, 44, 123, 1.0)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Consumer<FoodModel>(
            builder: (context, timer, child) =>
                TimerList(foodType: timer.foodData)),
        color: Theme.of(context).primaryColor,
      ),
      bottomNavigationBar: AdmobBanner(adUnitId: getBannerAdUnitId(), adSize: AdmobBannerSize.BANNER),
    );
  }
}

String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-9572658325484854/8937134637';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-9572658325484854/5591311219';
  }
  return null;
}
