import 'package:flutter/material.dart';
import '../models/mood.dart';
import '../theme/app_theme.dart';

class MoodSelectionButton extends StatelessWidget {
  final MoodType moodType;
  final Function(MoodType) onMoodSelected;

  const MoodSelectionButton({
    Key? key,
    required this.moodType,
    required this.onMoodSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;

    switch (moodType) {
      case MoodType.happy:
        iconData = Icons.sentiment_very_satisfied_outlined;
        iconColor = AppColors.happyGreen;
        break;
      case MoodType.okay:
        iconData = Icons.sentiment_neutral_outlined;
        iconColor = AppColors.okayYellow;
        break;
      case MoodType.sad:
        iconData = Icons.sentiment_dissatisfied_outlined;
        iconColor = AppColors.sadBlue;
        break;
    }

    String label;
    switch (moodType) {
      case MoodType.happy:
        label = 'Happy';
        break;
      case MoodType.okay:
        label = 'Okay';
        break;
      case MoodType.sad:
        label = 'Sad';
        break;
    }

    return Column(
      children: [
        InkWell(
          onTap: () => onMoodSelected(moodType),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              iconData,
              color: iconColor,
              size: 32,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }
}
