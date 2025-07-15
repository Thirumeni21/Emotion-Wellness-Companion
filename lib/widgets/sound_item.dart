import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/sound.dart';

class SoundItem extends StatelessWidget {
  final Sound sound;
  final VoidCallback onPlay;

  const SoundItem({
    Key? key,
    required this.sound,
    required this.onPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: InkWell(
        onTap: onPlay,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: sound.iconBackgroundColor ?? AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  sound.iconData ?? Icons.music_note,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (sound.mood != null)
                      Text(
                        sound.mood!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      sound.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      sound.duration,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textLight,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.play_arrow,
                color: AppColors.primaryBlue,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
