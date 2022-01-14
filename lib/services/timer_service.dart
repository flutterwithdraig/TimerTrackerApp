import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_timer/models/timed_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerService with ChangeNotifier {
  List<TimedEvent> _timedEvents = [];
  List<TimedEvent> get timedEvents => _timedEvents.reversed.toList();

  // TimedEvent(title: 'My Event 1', time: '01:24:17'),
  // TimedEvent(title: 'My Event 2', time: '01:24:18'),
  // TimedEvent(title: 'My Event 3', time: '01:24:19'),
  // TimedEvent(title: 'My Event 4', time: '01:24:20'),

  TimerService() {
    load();
  }

  void save() {
    String data = jsonEncode(
        _timedEvents.map((event) => TimedEvent.toMap(event)).toList());

    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('events', data);
    });
  }

  void load() {
    SharedPreferences.getInstance().then((prefs) {
      if (prefs.containsKey('events')) {
        String data = prefs.getString('events')!;
        _timedEvents = jsonDecode(data)
            .map<TimedEvent>((item) => TimedEvent.fromJson(item))
            .toList();
        notifyListeners();
      }
    });
  }

  void addNew() {
    TimedEvent newEvent = TimedEvent(title: 'New Event', time: '00:00:00');

    _timedEvents.add(newEvent);
    notifyListeners();
    save();
  }
}
