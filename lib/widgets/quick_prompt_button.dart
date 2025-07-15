import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class QuickPromptButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const QuickPromptButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryBlue.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.primaryBlue,
          ),
        ),
      ),
    );
  }
}
