import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer/config/colors.dart';
import 'package:flutter_timer/services/timer_service.dart';
import 'package:flutter_timer/sidebar/sidebar.dart';
import 'package:flutter_timer/widgets/event_list.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColours.drkBlue));

  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => TimerService(),
        child: Scaffold(
          drawer: SideBar(),
          drawerEnableOpenDragGesture: false,
          backgroundColor: Colors.grey[200],
          body: SafeArea(
            child: EventList(),
          ),
        ),
      ),
    );
  }
}
