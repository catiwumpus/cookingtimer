import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Sea of Thieves Cooking Assistant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _progress = 0.0;
  double _duration = 10;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void initState() {
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings('flutter');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(iOS: initializationSettingsIOs, android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initSetttings);
  }

  showNotification() async {
    var android = AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.high, importance: Importance.max);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'SoT Cooking Assistant', 'Your fish is done cooking, get it before it burns!', platform,
        payload: '');
  }

  void startTimer() {
    new Timer.periodic(
      Duration(milliseconds: 1),
      (Timer timer) => setState(
        () {
          _progress = ((timer.tick / 1000) / _duration).toDouble();
          if (_progress >= 1) {
            timer.cancel();
            playLocalAsset();
            Vibration.vibrate(duration: 1000);
            showNotification();
            _progress = 0.0;
          }
        },
      ),
    );
  }

  Future<AudioPlayer> playLocalAsset() async {
    AudioCache cache = new AudioCache();
    return await cache.play("ding.mp3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: [
            Card(
              elevation: 5.0,
              child: Stack(
                children: [
                  Container(
                    height: 56,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: LinearProgressIndicator(
                        value: _progress,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.lightGreenAccent),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.adjust_outlined),
                    title: Text("Fish"),
                    onTap: () => {HapticFeedback.mediumImpact(), startTimer()},
                  ),
                ],
              ),
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            )
          ],
        ),
        color: Colors.green.shade700,
      ),
    );
  }
}
