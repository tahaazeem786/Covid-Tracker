// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:covidtracker/screen/homescreen.dart';
import 'package:covidtracker/notification_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await NotificationService().init(); //
    runApp(MyApp());
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
