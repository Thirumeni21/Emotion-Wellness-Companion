import 'package:flutter/material.dart';
import '../models/mood.dart';
import '../theme/app_theme.dart';
import '../widgets/mood_selection.dart';
import '../widgets/wellness_tool_card.dart';
import '../widgets/bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedNavIndex = 0;
  
  void _onMoodSelected(MoodType mood) {
    // Handle mood selection
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('You selected: ${mood.toString().split('.').last}')),
    );
  }

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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'SmartMood',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Your wellness companion',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Text(
                          'SM',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  'How are you feeling today?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your mental wellness journey starts here',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MoodSelectionButton(
                      moodType: MoodType.happy,
                      onMoodSelected: _onMoodSelected,
                    ),
                    MoodSelectionButton(
                      moodType: MoodType.okay,
                      onMoodSelected: _onMoodSelected,
                    ),
                    MoodSelectionButton(
                      moodType: MoodType.sad,
                      onMoodSelected: _onMoodSelected,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(20),
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.primaryPurple,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.auto_awesome,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Feeling Bored?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Let AI suggest something perfect for your mood!',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/therapy');
                        },
                        icon: const Icon(Icons.auto_awesome, size: 18),
                        label: const Text('Get AI Suggestion'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.textDark,
                          elevation: 0,
                          side: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
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
                            'Heart Rate Variability',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textDark,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                '42ms',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryGreen,
                                ),
                              ),
                              Text(
                                'Balanced',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Connected to Apple Watch',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: const LinearProgressIndicator(
                          value: 0.7,
                          backgroundColor: Color(0xFFE0E0E0),
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryGreen),
                          minHeight: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Wellness Tools',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    WellnessToolCard(
                      backgroundColor: const Color(0xFF4BB5FF),
                      icon: Icons.air,
                      title: 'Guided Relaxation',
                      subtitle: 'Breathing with animations',
                      onTap: () {
                        Navigator.pushNamed(context, '/guided-relaxation');
                      },
                    ),
                    WellnessToolCard(
                      backgroundColor: AppColors.primaryPink,
                      icon: Icons.edit_note,
                      title: 'Smart Journal',
                      subtitle: 'Track mood & emotions',
                      onTap: () {
                        Navigator.pushNamed(context, '/journal');
                      },
                    ),
                    WellnessToolCard(
                      backgroundColor: const Color(0xFFFF9B57),
                      icon: Icons.track_changes,
                      title: 'Daily Challenges',
                      subtitle: 'Build healthy habits',
                      onTap: () {
                        Navigator.pushNamed(context, '/challenges');
                      },
                    ),
                    WellnessToolCard(
                      backgroundColor: const Color(0xFF4CD97B),
                      icon: Icons.headphones,
                      title: 'Sound Therapy',
                      subtitle: 'Calming nature sounds',
                      onTap: () {
                        Navigator.pushNamed(context, '/sound');
                      },
                    ),
                    WellnessToolCard(
                      backgroundColor: AppColors.primaryPurple,
                      icon: Icons.book,
                      title: 'Books & Podcasts',
                      subtitle: 'Curated wellness content',
                      onTap: () {
                        // Navigate to books/podcasts screen when implemented
                      },
                    ),
                    WellnessToolCard(
                      backgroundColor: AppColors.primaryPink,
                      icon: Icons.tv,
                      title: 'Feel-Good Shows',
                      subtitle: 'Anime & mood boosters',
                      onTap: () {
                        // Navigate to shows screen when implemented
                      },
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
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFFFFA07A), Color(0xFFFF6347)],
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Daily Inspiration',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '"Every small step counts toward your wellness journey"',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
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
              // Already on home
              break;
            case 1:
              Navigator.pushNamed(context, '/therapy');
              break;
            case 2:
              Navigator.pushNamed(context, '/sound');
              break;
            case 3:
              Navigator.pushNamed(context, '/insights');
              break;
            case 4:
              Navigator.pushNamed(context, '/connect');
              break;
          }
        },
      ),
    );
  }
}
