import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationTool  {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


  void initState() {
    var initializationSettingsAndroid = AndroidInitializationSettings('flutter');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSettings = InitializationSettings(iOS: initializationSettingsIOs, android: initializationSettingsAndroid);

    flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  showNotification(String foodName) async {
    var android = AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.defaultPriority, importance: Importance.high);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'SoT Cooking Assistant', 'Your $foodName is done cooking, get it before it burns!', platform,
        payload: '');
  }
}