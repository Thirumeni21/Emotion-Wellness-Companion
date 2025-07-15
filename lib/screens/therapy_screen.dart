import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_navigation.dart';
import '../widgets/quick_prompt_button.dart';

class TherapyScreen extends StatefulWidget {
  const TherapyScreen({Key? key}) : super(key: key);

  @override
  State<TherapyScreen> createState() => _TherapyScreenState();
}

class _TherapyScreenState extends State<TherapyScreen> {
  int _selectedNavIndex = 1; // Therapy tab
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Hello! I\'m here to support you. How are you feeling today?',
      'isUser': false,
    },
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'text': text,
        'isUser': true,
      });
      _messageController.clear();
    });

    // Simulate bot response
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _messages.add({
          'text': 'You said: $text',
          'isUser': false,
        });
      });
    });
  }

  void _useQuickPrompt(String prompt) {
    setState(() {
      _messages.add({
        'text': prompt,
        'isUser': true,
      });
      _messageController.clear();
    });

    // Simulate bot response
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _messages.add({
          'text': 'I understand that you are feeling ${prompt.toLowerCase()}. How can I assist you further?',
          'isUser': false,
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Therapy',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Talk to our AI therapist about your feelings.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigate to Home
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Icon(
                      Icons.home,
                      size: 28,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Insights
                      Navigator.pushReplacementNamed(context, '/insights');
                    },
                    child: const Icon(
                      Icons.insights,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      // Navigate to Connect
                      Navigator.pushReplacementNamed(context, '/connect');
                    },
                    child: const Icon(
                      Icons.connect_without_contact,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quick prompts:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_horiz),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          QuickPromptButton(
                            text: 'I\'m feeling anxious',
                            onTap: () => _useQuickPrompt('I\'m feeling anxious'),
                          ),
                          const SizedBox(width: 8),
                          QuickPromptButton(
                            text: 'Help me sleep better',
                            onTap: () => _useQuickPrompt('Help me sleep better'),
                          ),
                          const SizedBox(width: 8),
                          QuickPromptButton(
                            text: 'I\'m feeling sad',
                            onTap: () => _useQuickPrompt('I\'m feeling sad'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final message = _messages[_messages.length - 1 - index];
                          return _buildMessageBubble(
                            message['text'],
                            message['isUser'],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                hintText: 'Type a message...',
                                border: InputBorder.none,
                              ),
                              maxLines: null,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryBlue,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.send_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: _sendMessage,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
              // Already on therapy
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
  
  Widget _buildMessageBubble(String text, bool isUser) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isUser)
            Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                child: Text(
                  'SM',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isUser ? AppColors.primaryBlue : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isUser ? Colors.white : AppColors.textDark,
                fontSize: 15,
              ),
            ),
          ),
          if (isUser)
            Container(
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}