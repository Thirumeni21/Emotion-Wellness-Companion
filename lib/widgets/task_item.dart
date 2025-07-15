import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function(String) onToggle;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onToggle,
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
              onTap: () => onToggle(task.id),
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: task.isCompleted
                      ? Border.all(color: Colors.transparent, width: 2)
                      : Border.all(color: Colors.grey.shade300, width: 2),
                  color: task.isCompleted ? AppColors.primaryGreen : Colors.transparent,
                ),
                child: task.isCompleted
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,
                      decoration: task.isCompleted ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    task.category,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            if (task.isHighlighted)
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}
