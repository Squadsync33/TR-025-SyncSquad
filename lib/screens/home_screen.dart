import 'package:flutter/material.dart';
import '../theme.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';
import 'analyze_screen.dart';
import 'history_screen.dart';
import 'chat_screen.dart';

class HomeScreen extends StatefulWidget {
  final String email;
  final String domain;
  
  const HomeScreen({super.key, this.email = '', this.domain = ''});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const AnalyzeScreen(),
    const HistoryScreen(),
    const ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Row(
          children: [
            const Icon(Icons.security, color: AppTheme.primaryColor),
            const SizedBox(width: 8),
            Text(
              'JobShield AI',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(widget.email.isNotEmpty ? widget.email : 'User Profile', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.textPrimaryColor)),
                    if (widget.domain.isNotEmpty)
                      Text(widget.domain, style: const TextStyle(fontSize: 10, color: AppTheme.textSecondaryColor)),
                  ],
                ),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  offset: const Offset(0, 48),
                  child: CircleAvatar(
                    backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                    child: const Icon(Icons.person, color: AppTheme.primaryColor),
                  ),
                  onSelected: (value) {
                    if (value == 'logout') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'logout',
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: AppTheme.dangerColor, size: 20),
                          SizedBox(width: 8),
                          Text('Logout', style: TextStyle(color: AppTheme.dangerColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'DASHBOARD',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ANALYZE',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'HISTORY',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'CHAT',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
