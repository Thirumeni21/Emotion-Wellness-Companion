import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/support_item.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  State<ConnectScreen> createState() => _ConnectScreenState();
}

class _ConnectScreenState extends State<ConnectScreen> {
  int _selectedNavIndex = 4; // Connect tab

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
                              colors: [AppColors.primaryPurple, AppColors.primaryPink],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.people,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Connect & Support',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            Text(
                              'You\'re not alone on this journey',
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
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF6B6B),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.health_and_safety,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Emergency Support',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'If you\'re in crisis or need immediate help, please reach out:',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Call emergency number
                        },
                        icon: const Icon(Icons.phone),
                        label: const Text('Call Crisis Helpline'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B6B),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          minimumSize: const Size(double.infinity, 0),
                        ),
                      ),
                      const SizedBox(height: 12),
                      OutlinedButton.icon(
                        onPressed: () {
                          // Text message support
                        },
                        icon: const Icon(Icons.textsms),
                        label: const Text('Text for Support'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFFF6B6B),
                          side: const BorderSide(color: Color(0xFFFF6B6B)),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          minimumSize: const Size(double.infinity, 0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Support Resources',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                SupportItem(
                  title: 'Find a Therapist',
                  description: 'Connect with professional help in your area',
                  iconData: Icons.person,
                  iconBackgroundColor: AppColors.primaryBlue,
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                SupportItem(
                  title: 'Support Groups',
                  description: 'Join communities facing similar challenges',
                  iconData: Icons.group,
                  iconBackgroundColor: AppColors.primaryPurple,
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                SupportItem(
                  title: 'Educational Resources',
                  description: 'Articles and videos on mental wellness',
                  iconData: Icons.menu_book,
                  iconBackgroundColor: AppColors.primaryGreen,
                  onTap: () {},
                ),
                const SizedBox(height: 16),
                SupportItem(
                  title: 'Family Resources',
                  description: 'Help for loved ones supporting you',
                  iconData: Icons.family_restroom,
                  iconBackgroundColor: AppColors.primaryPink,
                  onTap: () {},
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
                            colors: [Color(0xFF4CD97B), Color(0xFF4BB5FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.chat_bubble_outline,
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
                              'Community Chat',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Connect with others on similar wellness journeys',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryGreen,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Join'),
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
              // Already on connect
              break;
          }
        },
      ),
    );
  }
}
