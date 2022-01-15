import 'package:flutter/material.dart';
import 'package:flutter_timer/config/colors.dart';
import 'package:flutter_timer/models/timed_event.dart';
import 'package:flutter_timer/services/timer_service.dart';
import 'package:provider/provider.dart';

class EventItem extends StatelessWidget {
  final TimedEvent event;

  const EventItem({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(event.id.toString()),
      confirmDismiss: (direction) async {
        if (event.active) return false;
        return true;
      },
      onDismissed: (direction) {
        context.read<TimerService>().delete(event.id);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(event.title),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  event.active ? Icons.access_time : Icons.edit,
                  color: AppColours.grey,
                  size: 20,
                ),
                SizedBox(height: 5),
                Text(event.active
                    ? context.watch<TimerService>().currentTime
                    : event.time),
              ],
            )
          ],
        ),
      ),
    );
  }
}
