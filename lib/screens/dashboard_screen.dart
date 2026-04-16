import 'package:flutter/material.dart';
import '../theme.dart';
import 'analyze_screen.dart';
import 'history_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Intelligence Overview',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Guardian protocol active. Monitoring global employment deception networks.',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondaryColor,
            ),
          ),
          const SizedBox(height: 24),
          
          // Stats Cards
          _buildStatCard(
            title: 'TOTAL JOBS CHECKED',
            count: '1,284',
            subtitle: '+12% this month',
            icon: Icons.data_usage,
            color: AppTheme.primaryColor,
            bgColor: Colors.white,
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            title: 'FRAUD JOBS COUNT',
            count: '42',
            subtitle: 'High Risk Pattern Detected',
            icon: Icons.warning_amber_rounded,
            color: AppTheme.dangerColor,
            bgColor: AppTheme.dangerBgColor,
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            title: 'SAFE JOBS COUNT',
            count: '1,198',
            subtitle: 'Verified Origins',
            icon: Icons.verified_user_outlined,
            color: AppTheme.primaryColor,
            bgColor: const Color(0xFFEFF6FF), // Light blue
          ),
          const SizedBox(height: 16),
          _buildStatCard(
            title: 'SUSPICIOUS JOBS',
            count: '44',
            subtitle: 'Manual Review Pending',
            icon: Icons.remove_red_eye_outlined,
            color: AppTheme.warningColor,
            bgColor: AppTheme.warningBgColor,
          ),
          const SizedBox(height: 24),

          // Fraud Trends
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Fraud Trends',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('LAST 7 DAYS', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Simple placeholder for chart
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: const Center(
                    child: Text('Chart Placeholder', style: TextStyle(color: Colors.grey)),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text('MON', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Text('TUE', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Text('WED', style: TextStyle(fontSize: 10, color: AppTheme.dangerColor, fontWeight: FontWeight.bold)),
                    Text('THU', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Text('FRI', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Text('SAT', style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Text('SUN', style: TextStyle(fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Recent Analysis
          const Text(
            'Recent Analysis',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: 16),
          _buildRecentAnalysisItem(
            role: 'Remote Data Entry Lead',
            company: 'Amazon Global (Spoofed)',
            time: '2h ago',
            iconColor: AppTheme.dangerColor,
            iconBgColor: AppTheme.dangerBgColor,
            icon: Icons.do_not_disturb_alt,
          ),
          _buildRecentAnalysisItem(
            role: 'Senior Product Designer',
            company: 'Stripe Inc.',
            time: '5h ago',
            iconColor: AppTheme.primaryColor,
            iconBgColor: const Color(0xFFEFF6FF),
            icon: Icons.verified,
          ),
          _buildRecentAnalysisItem(
            role: 'Financial Operations Analyst',
            company: 'CryptoFlow Solutions',
            time: '8h ago',
            iconColor: AppTheme.warningColor,
            iconBgColor: AppTheme.warningBgColor,
            icon: Icons.priority_high,
          ),
          const SizedBox(height: 24),

          // Protect Your Search Banner
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Protect your search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Our AI has identified a 25% increase in phishing attempts targeting job seekers this week.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(title: const Text('New Job Analysis')),
                            body: const AnalyzeScreen(),
                          ),
                        ),
                      );
                    },
                    child: const Text('New Job Analysis'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Threat Intelligence
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E7FF), // indigo-100 kind of color
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Threat Intelligence',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 16),
                _buildThreatItem(
                  title: '"Check-Cashing" Scam',
                  desc: 'New wave of fraudulent "Secret Shopper" roles originating from South East Asia.',
                  icon: Icons.warning,
                ),
                _buildThreatItem(
                  title: 'Domain Spoofing Alert',
                  desc: 'Watch for "careers-apple.com" and similar variants currently active.',
                  icon: Icons.language,
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(title: const Text('Threat History')),
                          body: const HistoryScreen(),
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'VIEW ALL THREATS →',
                    style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String count,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: bgColor == Colors.white
            ? [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4))]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
                  letterSpacing: 1,
                ),
              ),
              Icon(icon, color: color, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            count,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.trending_up, size: 14, color: color),
              const SizedBox(width: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRecentAnalysisItem({
    required String role,
    required String company,
    required String time,
    required Color iconColor,
    required Color iconBgColor,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(role, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text('$company • Scanned $time', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.grey.shade400),
        ],
      ),
    );
  }

  Widget _buildThreatItem({
    required String title,
    required String desc,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppTheme.dangerColor, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
