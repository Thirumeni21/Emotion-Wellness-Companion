class JournalEntry {
  final String id;
  final String title;
  final String content;
  final String mood;
  final DateTime date;
  final String emoji;

  JournalEntry({
    required this.id,
    required this.title,
    required this.content,
    required this.mood,
    required this.date,
    required this.emoji,
  });
}
