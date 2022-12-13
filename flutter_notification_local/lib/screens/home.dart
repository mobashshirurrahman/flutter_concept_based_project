import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_local/main.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  void showNoti() async {
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
      "noti-test-1",
      "test-noti",
      priority: Priority.max,
      importance: Importance.max,
    );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
        0, "My title", "Lets do it", notificationDetails);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: showNoti,
        child: Icon(
          Icons.notification_add,
        ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
