import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  //NotificationService a singleton object
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static const channelId = '123';

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon.png');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid, macOS: null);

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  AndroidNotificationDetails _androidNotificationDetails =
      AndroidNotificationDetails(
    'channel ID',
    'channel name',
    playSound: true,
    priority: Priority.high,
    importance: Importance.high,
  );

  Future<void> showNotifications() async {
    await flutterLocalNotificationsPlugin.show(
      1,
      "Notification Title",
      "This is the Notification Body!",
      NotificationDetails(android: _androidNotificationDetails),
    );
  }

  Future<void> scheduleNotifications() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        "Notification Title",
        "This is the Notification Body!",
        tz.TZDateTime.now(tz.UTC).add(const Duration(seconds: 5)),
        NotificationDetails(android: _androidNotificationDetails),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  Future<void> cancelNotifications(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

Future selectNotification(String payload) async {
  print(payload);
}
