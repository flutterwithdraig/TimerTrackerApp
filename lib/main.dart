import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer/config/colors.dart';
import 'package:flutter_timer/sidebar/header.dart';
import 'package:flutter_timer/sidebar/menu.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColours.drkBlue));

  runApp(const TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [AppHeader(), AppMenu()],
      )),
    );
  }
}
