import 'package:flutter/material.dart';

class MoodEmoji extends StatelessWidget {
  final String emoji;
  final double size;

  const MoodEmoji({
    Key? key,
    required this.emoji,
    this.size = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      emoji,
      style: TextStyle(fontSize: size),
    );
  }
}
