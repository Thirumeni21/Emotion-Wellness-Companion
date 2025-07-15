import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navigation.dart';
import '../models/task.dart';
import '../widgets/task_item.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({Key? key}) : super(key: key);

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  int _selectedNavIndex = 0; // Home tab
  
  // Sample tasks
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Drink water now',
      category: 'Health',
      isCompleted: false,
      isHabit: false,
    ),
    Task(
      id: '2',
      title: 'Do 10 stretches',
      category: 'Fitness',
      isCompleted: false,
      isHabit: false,
    ),
    Task(
      id: '3',
      title: 'Listen to a calming sound',
      category: 'Mindfulness',
      isCompleted: true,
      isHabit: false,
      isHighlighted: true,
    ),
    Task(
      id: '4',
      title: 'Write in your journal',
      category: 'Mental Health',
      isCompleted: false,
      isHabit: false,
    ),
    Task(
      id: '5',
      title: 'Try a breathing exercise',
      category: 'Mindfulness',
      isCompleted: true,
      isHabit: false,
      isHighlighted: true,
    ),
    Task(
      id: '6',
      title: 'Smile at yourself in mirror',
      category: 'Self-Care',
      isCompleted: false,
      isHabit: false,
    ),
  ];

  void _toggleTaskCompleted(String taskId) {
    setState(() {
      final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
      if (taskIndex != -1) {
        _tasks[taskIndex] = _tasks[taskIndex].copyWith(
          isCompleted: !_tasks[taskIndex].isCompleted,
        );
      }
    });
  }

  int get _completedTasksCount => _tasks.where((task) => task.isCompleted).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF9B57), Color(0xFFFF7F50)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.track_changes,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Challenges',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            Text(
                              'Build healthy habits day by day',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              const Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'completed today',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade700,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Today\'s Progress',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.local_fire_department,
                                color: Colors.orange,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '3 day streak!',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: _completedTasksCount / _tasks.length,
                          backgroundColor: Colors.grey.shade200,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                          minHeight: 10,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '$_completedTasksCount of ${_tasks.length} tasks completed',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quick Tasks',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        // Add custom task
                      },
                      icon: const Icon(Icons.add, color: AppColors.primaryGreen),
                      label: Text(
                        'Add Custom',
                        style: TextStyle(color: AppColors.primaryGreen),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _tasks.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: TaskItem(
                        task: _tasks[index],
                        onToggle: _toggleTaskCompleted,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedNavIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedNavIndex = index;
          });
          
          // Handle navigation
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/therapy');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/sound');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/insights');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/connect');
              break;
          }
        },
      ),
    );
  }
}
