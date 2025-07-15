import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navigation.dart';
import '../models/sound.dart';
import '../widgets/sound_item.dart';
import '../widgets/popular_sound_item.dart';

class SoundTherapyScreen extends StatefulWidget {
  const SoundTherapyScreen({Key? key}) : super(key: key);

  @override
  State<SoundTherapyScreen> createState() => _SoundTherapyScreenState();
}

class _SoundTherapyScreenState extends State<SoundTherapyScreen> {
  int _selectedNavIndex = 2; // Sound tab
  
  // Sample mood-based sounds
  final List<Sound> _moodSounds = [
    Sound(
      id: '1',
      title: 'Deep Ocean Waves',
      mood: 'FEELING ANXIOUS?',
      duration: '10:30',
      iconData: Icons.waves,
      iconBackgroundColor: Color(0xFF4BB5FF),
    ),
    Sound(
      id: '2',
      title: 'Gentle Rain',
      mood: 'FEELING DOWN?',
      duration: '15:45',
      iconData: Icons.water_drop,
      iconBackgroundColor: Color(0xFF8DA9C4),
    ),
    Sound(
      id: '3',
      title: 'Forest Sounds',
      mood: 'FEELING STRESSED?',
      duration: '20:15',
      iconData: Icons.forest,
      iconBackgroundColor: Color(0xFF4CD97B),
    ),
  ];
  
  // Sample popular sounds
  final List<Sound> _popularSounds = [
    Sound(
      id: '4',
      title: 'Peaceful Piano',
      artist: 'Calm Studio',
      duration: '8:20',
      isFavorite: true,
    ),
    Sound(
      id: '5',
      title: 'Morning Meditation',
      artist: 'Mindful Music',
      duration: '12:10',
      isFavorite: false,
    ),
    Sound(
      id: '6',
      title: 'Nature\'s Symphony',
      artist: 'Earth Sounds',
      duration: '18:45',
      isFavorite: true,
    ),
    Sound(
      id: '7',
      title: 'Tibetan Bowls',
      artist: 'Meditation Masters',
      duration: '11:30',
      isFavorite: false,
    ),
  ];

  void _toggleFavorite(String soundId) {
    setState(() {
      final index = _popularSounds.indexWhere((sound) => sound.id == soundId);
      if (index != -1) {
        _popularSounds[index] = _popularSounds[index].copyWith(
          isFavorite: !_popularSounds[index].isFavorite,
        );
      }
    });
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
                            Icons.music_note,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Sound Therapy',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            Text(
                              'Healing sounds for your mood',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
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
                const SizedBox(height: 30),
                const Text(
                  'For Your Mood',
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
                  itemCount: _moodSounds.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SoundItem(
                        sound: _moodSounds[index],
                        onPlay: () {
                          // Play sound
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                const Text(
                  'Popular This Week',
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
                  itemCount: _popularSounds.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: PopularSoundItem(
                        sound: _popularSounds[index],
                        onPlay: () {
                          // Play sound
                        },
                        onToggleFavorite: _toggleFavorite,
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
              // Already on sound
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
