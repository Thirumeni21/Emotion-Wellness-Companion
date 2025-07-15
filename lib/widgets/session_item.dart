import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SessionItem extends StatelessWidget {
  final IconData icon;
  final Color iconBackgroundColor;
  final String title;
  final String subtitle;
  final String duration;
  final VoidCallback onTap;

  const SessionItem({
    Key? key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.onTap,
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
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
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
