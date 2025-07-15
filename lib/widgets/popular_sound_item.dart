import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/sound.dart';

class PopularSoundItem extends StatelessWidget {
  final Sound sound;
  final VoidCallback onPlay;
  final Function(String) onToggleFavorite;

  const PopularSoundItem({
    Key? key,
    required this.sound,
    required this.onPlay,
    required this.onToggleFavorite,
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            InkWell(
              onTap: onPlay,
              child: const Icon(
                Icons.play_arrow,
                color: AppColors.primaryBlue,
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    '${sound.artist} • ${sound.duration}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                sound.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: sound.isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () => onToggleFavorite(sound.id),
            ),
          ],
        ),
      ),
    );
  }
}
