enum MoodType {
  happy,
  okay,
  sad,
}

class Mood {
  final MoodType type;
  final DateTime timestamp;
  final String? note;

  Mood({
    required this.type,
    required this.timestamp,
    this.note,
  });
}
