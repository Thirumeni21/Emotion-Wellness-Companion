import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/chart_container.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({Key? key}) : super(key: key);

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  int _selectedNavIndex = 3; // Insights tab
  String _selectedPeriod = 'Week';
  final List<String> _periods = ['Day', 'Week', 'Month', 'Year'];

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
                              colors: [AppColors.primaryBlue, Color(0xFF4BB5FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.bar_chart,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Insights',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            Text(
                              'Track your wellness journey',
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
                Row(
                  children: _periods
                      .map(
                        (period) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(period),
                            selected: _selectedPeriod == period,
                            selectedColor: AppColors.primaryBlue.withOpacity(0.2),
                            onSelected: (selected) {
                              if (selected) {
                                setState(() {
                                  _selectedPeriod = period;
                                });
                              }
                            },
                            labelStyle: TextStyle(
                              color: _selectedPeriod == period
                                  ? AppColors.primaryBlue
                                  : AppColors.textLight,
                              fontWeight: _selectedPeriod == period
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                color: _selectedPeriod == period
                                    ? AppColors.primaryBlue
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
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
                      const Text(
                        'Mood Overview',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your emotional trends over the past $_selectedPeriod',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 16),
                      const ChartContainer(height: 200),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildMoodStat('Happy', '42%', AppColors.happyGreen),
                          _buildMoodStat('Okay', '35%', AppColors.okayYellow),
                          _buildMoodStat('Sad', '23%', AppColors.sadBlue),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Wellness Factors',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildWellnessCard(
                        title: 'Sleep',
                        value: '7.2',
                        unit: 'hrs',
                        trend: '+0.5',
                        iconData: Icons.nightlight,
                        iconColor: const Color(0xFF7B6CF6),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildWellnessCard(
                        title: 'Activity',
                        value: '5,234',
                        unit: 'steps',
                        trend: '+12%',
                        iconData: Icons.directions_walk,
                        iconColor: const Color(0xFF4CD97B),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildWellnessCard(
                        title: 'Mindfulness',
                        value: '15',
                        unit: 'min',
                        trend: '+5',
                        iconData: Icons.self_improvement,
                        iconColor: AppColors.primaryPurple,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildWellnessCard(
                        title: 'Stress Level',
                        value: 'Low',
                        unit: '',
                        trend: 'stable',
                        iconData: Icons.waves,
                        iconColor: AppColors.primaryBlue,
                      ),
                    ),
                  ],
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
              // Already on insights
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/connect');
              break;
          }
        },
      ),
    );
  }

  Widget _buildMoodStat(String label, String percentage, Color color) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              percentage,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textDark,
          ),
        ),
      ],
    );
  }

  Widget _buildWellnessCard({
    required String title,
    required String value,
    required String unit,
    required String trend,
    required IconData iconData,
    required Color iconColor,
  }) {
    return Container(
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
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  iconData,
                  color: iconColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                unit,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: 12,
                    ),
                    Text(
                      trend,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
