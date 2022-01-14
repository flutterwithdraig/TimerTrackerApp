class TimedEvent {
  final String title;
  final String time;

  TimedEvent({
    required this.title,
    required this.time,
  });

  static Map<String, dynamic> toMap(TimedEvent event) => {
        'title': event.title,
        'time': event.time,
      };

  factory TimedEvent.fromJson(jsonData) {
    return TimedEvent(
      title: jsonData['title'],
      time: jsonData['time'],
    );
  }
}
