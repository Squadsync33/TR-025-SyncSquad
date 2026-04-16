import 'package:flutter/material.dart';
import '../theme.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const List<Map<String, dynamic>> _mockHistory = [
    {'role': 'Software Engineer - Legit Corp', 'score': 12, 'daysAgo': 0},
    {'role': 'Data Entry Clerk - Unknown LLC', 'score': 45, 'daysAgo': 1},
    {'role': 'Remote Assistant - Fake Inc.', 'score': 85, 'daysAgo': 2},
    {'role': 'Product Manager - Big Tech', 'score': 5, 'daysAgo': 3},
    {'role': 'Crypto Trader - Scammy Co', 'score': 92, 'daysAgo': 4},
    {'role': 'Freelance Designer - Odd Jobs', 'score': 58, 'daysAgo': 5},
  ];

  Color _getColor(int score) {
    if (score <= 30) return AppTheme.primaryColor;
    if (score <= 60) return AppTheme.warningColor;
    return AppTheme.dangerColor;
  }

  Color _getBgColor(int score) {
    if (score <= 30) return AppTheme.primaryColor.withOpacity(0.1);
    if (score <= 60) return AppTheme.warningBgColor;
    return AppTheme.dangerBgColor;
  }

  IconData _getIcon(int score) {
    if (score <= 30) return Icons.check_circle_outline;
    if (score <= 60) return Icons.remove_red_eye_outlined;
    return Icons.warning_amber_rounded;
  }

  String _getLabel(int score) {
    if (score <= 30) return 'Safe';
    if (score <= 60) return 'Suspicious';
    return 'Fraud';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _mockHistory.length,
      itemBuilder: (context, index) {
        final item = _mockHistory[index];
        final int score = item['score'];
        final color = _getColor(score);

        return Card(
          margin: const EdgeInsets.only(bottom: 12.0),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(16.0),
            leading: CircleAvatar(
              backgroundColor: _getBgColor(score),
              child: Icon(
                _getIcon(score),
                color: color,
              ),
            ),
            title: Text(
              item['role'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text('Analyzed on: ${DateTime.now().subtract(Duration(days: item['daysAgo'])).toString().split(' ')[0]}'),
                const SizedBox(height: 4),
                Text(
                  '${_getLabel(score)} - $score% Fraud Probability',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Navigate to detailed results
            },
          ),
        );
      },
    );
  }
}
 