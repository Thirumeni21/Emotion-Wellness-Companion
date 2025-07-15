class Task {
  final String id;
  final String title;
  final String category;
  final bool isCompleted;
  final bool isHabit;
  final bool isHighlighted;

  Task({
    required this.id,
    required this.title,
    required this.category,
    required this.isCompleted,
    required this.isHabit,
    this.isHighlighted = false,
  });

  Task copyWith({
    String? id,
    String? title,
    String? category,
    bool? isCompleted,
    bool? isHabit,
    bool? isHighlighted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
      isHabit: isHabit ?? this.isHabit,
      isHighlighted: isHighlighted ?? this.isHighlighted,
    );
  }
}
