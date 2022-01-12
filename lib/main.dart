import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_timer/config/colors.dart';
import 'package:flutter_timer/sidebar/sidebar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColours.drkBlue));

  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  TimerApp({Key? key}) : super(key: key);

  final List<Widget> timedEvents = [
    EventItem(text: 'My Event 1', time: '01:24:17'),
    EventItem(text: 'My Event 2', time: '01:24:18'),
    EventItem(text: 'My Event 3', time: '01:24:19'),
    EventItem(text: 'My Event 4', time: '01:24:20'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: SideBar(),
        drawerEnableOpenDragGesture: false,
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: EventList(timedEvents: timedEvents),
        ),
      ),
    );
  }
}

class EventList extends StatelessWidget {
  const EventList({
    Key? key,
    required this.timedEvents,
  }) : super(key: key);

  final List<Widget> timedEvents;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(),
        itemCount: timedEvents.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 35,
                    color: AppColours.blue,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: AppColours.blue,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return timedEvents[index - 1];
          }
        },
      ),
    );
  }
}

class EventItem extends StatelessWidget {
  final String text;
  final String time;

  const EventItem({
    Key? key,
    required this.text,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.edit,
                color: AppColours.grey,
                size: 20,
              ),
              SizedBox(height: 5),
              Text(time),
            ],
          )
        ],
      ),
    );
  }
}
