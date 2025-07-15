import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/session_item.dart';

class GuidedRelaxationScreen extends StatefulWidget {
  const GuidedRelaxationScreen({Key? key}) : super(key: key);

  @override
  State<GuidedRelaxationScreen> createState() => _GuidedRelaxationScreenState();
}

class _GuidedRelaxationScreenState extends State<GuidedRelaxationScreen> {
  int _selectedNavIndex = 0;

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
                          decoration: BoxDecoration(
                            color: AppColors.primaryGreen,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.air,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Guided Relaxation',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Breathe, relax, and find your center',
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
                const SizedBox(height: 40),
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
                      const Text(
                        'Ready to begin?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Find a comfortable position, close your eyes, and let the guided breathing help you relax.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            Icons.lightbulb_outline,
                            color: Colors.amber,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Tip: Use headphones for the best experience',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Choose Your Session',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                SessionItem(
                  icon: Icons.waves,
                  iconBackgroundColor: const Color(0xFF4BB5FF),
                  title: 'Ocean Waves',
                  subtitle: 'Breathe with the rhythm of gentle ocean waves',
                  duration: '5 min',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                SessionItem(
                  icon: Icons.forest,
                  iconBackgroundColor: const Color(0xFF4CD97B),
                  title: 'Forest Sounds',
                  subtitle: 'Find peace among the trees',
                  duration: '7 min',
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                SessionItem(
                  icon: Icons.air,
                  iconBackgroundColor: AppColors.primaryPurple,
                  title: 'Mountain Breeze',
                  subtitle: 'Let the mountain air guide your breath',
                  duration: '4 min',
                  onTap: () {},
                ),
                const SizedBox(height: 32),
                const Text(
                  'Benefits of Guided Breathing',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                // Benefits content would go here
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
