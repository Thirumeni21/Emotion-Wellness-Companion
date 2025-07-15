import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home, 'Home'),
            _buildNavItem(1, Icons.chat_bubble_outline, 'Therapy'),
            _buildNavItem(2, Icons.music_note, 'Sound'),
            _buildNavItem(3, Icons.bar_chart, 'Insights'),
            _buildNavItem(4, Icons.people, 'Connect'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final bool isSelected = selectedIndex == index;
    Color backgroundColor;
    Color iconColor;
    Color textColor;

    if (isSelected) {
      switch (index) {
        case 0:
          backgroundColor = AppColors.primaryGreen;
          break;
        case 1:
          backgroundColor = AppColors.primaryPink;
          break;
        case 2:
          backgroundColor = AppColors.primaryPurple;
          break;
        case 3:
          backgroundColor = AppColors.primaryBlue;
          break;
        case 4:
          backgroundColor = AppColors.primaryPurple;
          break;
        default:
          backgroundColor = AppColors.primaryBlue;
      }
      iconColor = Colors.white;
      textColor = AppColors.textDark;
    } else {
      backgroundColor = Colors.transparent;
      iconColor = AppColors.textLight;
      textColor = AppColors.textLight;
    }

    return InkWell(
      onTap: () => onItemSelected(index),
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
