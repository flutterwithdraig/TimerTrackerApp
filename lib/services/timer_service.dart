import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_timer/helpers.dart';
import 'package:flutter_timer/models/timed_event.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerService with ChangeNotifier {
  List<TimedEvent> _timedEvents = [];
  List<TimedEvent> get timedEvents => _timedEvents.reversed.toList();

  Timer? timer;

  bool get timerActive => _timedEvents.any((e) => e.active);
  TimedEvent get activeEvent => _timedEvents.firstWhere((e) => e.active);

  int _seconds = 0;
  String get currentTime {
    Duration current = Duration(seconds: _seconds);
    String hours = padNumber(current.inHours);
    String minutes = padNumber(current.inMinutes.remainder(60));
    String seconds = padNumber(current.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }

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

        if (timerActive) {
          DateTime startTime = DateTime.parse(activeEvent.startTime);
          _seconds = DateTime.now().difference(startTime).inSeconds;
          startTimer();
        }

        notifyListeners();
      }
    });
  }

  void addNew() {
    if (timerActive) return;

    DateTime startTime = DateTime.now();

    TimedEvent newEvent = TimedEvent(
        id: startTime.millisecondsSinceEpoch,
        title: 'New Event',
        time: '00:00:00',
        active: true,
        startTime: startTime.toIso8601String());

    _timedEvents.add(newEvent);
    notifyListeners();

    startTimer();

    save();
  }

  void startTimer() {
    _seconds = 0;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _seconds++;
      notifyListeners();
    });
  }

  void stop() {
    if (timer != null && !timer!.isActive) return;

    timer!.cancel();
    TimedEvent event = activeEvent.copyWith(
      active: false,
      time: currentTime,
    );

    int currentIndex = _timedEvents.indexWhere((e) => e.active);
    _timedEvents[currentIndex] = event;
    save();
    notifyListeners();
  }

  void delete(int id) {
    _timedEvents.removeWhere((e) => e.id == id && e.active == false);
    notifyListeners();
    save();
  }
}
