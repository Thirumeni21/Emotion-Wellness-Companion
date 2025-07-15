import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navigation.dart';
import '../models/journal_entry.dart';


class JournalScreen extends StatefulWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  State<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  int _selectedNavIndex = 1; // Assuming journal is part of therapy tab
  
  // Sample data
  final List<JournalEntry> _entries = [
    JournalEntry(
      id: '1',
      title: 'Great Day at Work',
      content: 'Had a productive meeting today and felt really accomplished. The team collaboration was...',
      mood: 'Happy',
      date: DateTime(2025, 1, 10),
      emoji: '😊',
    ),
    JournalEntry(
      id: '2',
      title: 'Peaceful Evening',
      content: 'Spent time reading and listening to nature sounds. Feeling very centered and peaceful.',
      mood: 'Calm',
      date: DateTime(2025, 1, 9),
      emoji: '😌',
    ),
    JournalEntry(
      id: '3',
      title: 'Challenging Moment',
      content: 'Work was overwhelming today, but I practiced breathing exercises and it helped me feel better.',
      mood: 'Stressed',
      date: DateTime(2025, 1, 8),
      emoji: '😓',
    ),
  ];
  
  final Map<String, int> _moodCounts = {
    '😊': 1,
    '😌': 1,
    '😓': 1,
  };
  
  final Map<String, int> _topEmotions = {
    'Happy': 1,
    'Calm': 1,
    'Stressed': 1,
  };

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
                              colors: [Color(0xFFFF7E5F), Color(0xFFFFB66D)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.edit_note,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Journal',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            Text(
                              'Your thoughts and feelings',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
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
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.primaryBlue, AppColors.primaryPurple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // Navigate to add journal entry
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.favorite,
                                  color: Colors.redAccent,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Mood Tracker',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildMoodCount('😊', _moodCounts['😊'] ?? 0),
                                _buildMoodCount('😌', _moodCounts['😌'] ?? 0),
                                _buildMoodCount('😓', _moodCounts['😓'] ?? 0),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.trending_up,
                                  color: AppColors.primaryPurple,
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Top Emotions',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            _buildEmotionItem('Happy', _topEmotions['Happy'] ?? 0),
                            _buildEmotionItem('Calm', _topEmotions['Calm'] ?? 0),
                            _buildEmotionItem('Stressed', _topEmotions['Stressed'] ?? 0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Recent Entries',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _entries.length,
                  itemBuilder: (context, index) {
                    final entry = _entries[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Container(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    entry.emoji,
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          entry.title,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textDark,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_today,
                                              size: 12,
                                              color: AppColors.textLight,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              DateFormat('M/d/yyyy').format(entry.date),
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: AppColors.textLight,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: _getMoodColor(entry.mood).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  entry.mood,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: _getMoodColor(entry.mood),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                entry.content,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors.textDark,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
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
          
          // Handle navigation based on bottom nav selection
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/');
              break;
            case 1:
              // Already on therapy/journal
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

  Widget _buildMoodCount(String emoji, int count) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        const SizedBox(height: 4),
        Text(count.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildEmotionItem(String emotion, int count) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            emotion,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textDark,
            ),
          ),
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }

  Color _getMoodColor(String mood) {
    switch (mood) {
      case 'Happy':
        return AppColors.happyGreen;
      case 'Calm':
        return AppColors.primaryBlue;
      case 'Stressed':
        return AppColors.okayYellow;
      default:
        return AppColors.textLight;
    }
  }
}
