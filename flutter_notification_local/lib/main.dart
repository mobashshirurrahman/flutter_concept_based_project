import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_local/screens/home.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AndroidInitializationSettings androidSetting =
      AndroidInitializationSettings("@mipmap/ic_launcher");
  InitializationSettings initializationSettings = InitializationSettings(
    android: androidSetting,
  );
  bool? initialized =
      await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  if (kDebugMode) {
    print("Notifi: $initialized");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Push Noti Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHome(),
    );
  }
}
