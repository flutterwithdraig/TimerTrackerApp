import 'package:flutter/material.dart';
import 'package:flutter_timer/config/colors.dart';
import 'package:flutter_timer/models/timed_event.dart';
import 'package:flutter_timer/services/timer_service.dart';
import 'package:provider/provider.dart';

import 'event_item.dart';

class EventList extends StatelessWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TimerService timerService = context.watch<TimerService>();

    List<TimedEvent> timedEvents = timerService.timedEvents;

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
                  child: IconButton(
                    onPressed: () {
                      timerService.addNew();
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: 35,
                      color: AppColours.blue,
                    ),
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
            return EventItem(event: timedEvents[index - 1]);
          }
        },
      ),
    );
  }
}
