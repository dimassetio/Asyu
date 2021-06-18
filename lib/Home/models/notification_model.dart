import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterNotifications =
    FlutterLocalNotificationsPlugin();

var notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
  'channel id',
  'channel name',
  'channel description',
  sound: RawResourceAndroidNotificationSound('adzan'),
  playSound: true,
  importance: Importance.max,
  priority: Priority.high,
  autoCancel: false,
));
