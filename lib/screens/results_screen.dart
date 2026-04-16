import 'package:flutter/material.dart';
import '../theme.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('Analysis Results'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Probability Card
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: AppTheme.warningBgColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4))
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '78%',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange.shade800,
                              ),
                            ),
                            const Text(
                              'PROBABILITY',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade600,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Suspicious',
                          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            const Text(
              'High Risk Patterns Detected',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimaryColor,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Our 'Sentinel Core' engine has identified multiple anomalies in this job listing. The compensation structure and communication channels deviate significantly from industry standards.",
              style: TextStyle(fontSize: 14, color: AppTheme.textSecondaryColor, height: 1.5),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildTag(Icons.security, 'SENTINEL CORE v4.2', Colors.blue.shade100, Colors.blue.shade700),
                const SizedBox(width: 8),
                _buildTag(Icons.warning, 'MANUAL REVIEW ADVISED', Colors.orange.shade100, Colors.orange.shade800),
              ],
            ),
            const SizedBox(height: 32),

            // Real Job Comparison Engine
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Real Job Comparison\nEngine', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Icon(Icons.bar_chart, color: Colors.grey.shade400),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Compensation row
                  Text('COMPENSATION DISCREPANCY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey.shade500)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.warningBgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('SUSPICIOUS LISTING', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.orange.shade800)),
                              const SizedBox(height: 8),
                              const Text('₹60,000', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text('/ week', style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        children: [
                          const Text('400%', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.dangerColor, fontSize: 16)),
                          const Text('Higher', style: TextStyle(color: AppTheme.dangerColor, fontSize: 12)),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('MARKET BENCHMARK', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.grey.shade600)),
                              const SizedBox(height: 8),
                              const Text('₹15,000', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text('/ month', style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Email Authenticity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('EMAIL AUTHENTICITY', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey.shade500)),
                      Text('Low Trust', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange.shade800)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.alternate_email, color: AppTheme.dangerColor, size: 16),
                        const SizedBox(width: 8),
                        const Text('hr.recruiter@gmail.com', style: TextStyle(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Explainable AI
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFEEF2FF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Explainable AI', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  _buildExplainItem(
                    Icons.cancel,
                    AppTheme.dangerColor,
                    'Free email domain',
                    'Official recruitment never uses @gmail, @outlook, or generic providers.',
                  ),
                  _buildExplainItem(
                    Icons.attach_money,
                    AppTheme.dangerColor,
                    'Unrealistic salary',
                    'The offered pay is 4x the industry average for entry-level roles.',
                  ),
                  _buildExplainItem(
                    Icons.help_outline,
                    AppTheme.warningColor,
                    'Vague Job Description',
                    "High usage of 'urgent' and 'easy work' buzzwords often linked to scams.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Chat with AI CTA
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Need more proof?', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.chat),
                      label: const Text('Chat with AI'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Red Flag Highlight
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
                      const SizedBox(width: 8),
                      const Text('Red Flag Highlight', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '"...',
                    style: TextStyle(fontSize: 24, color: Colors.grey, fontWeight: FontWeight.bold, height: 0.5),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16, color: AppTheme.textPrimaryColor, height: 1.5, fontStyle: FontStyle.italic),
                      children: [
                        const TextSpan(text: 'earn '),
                        TextSpan(text: 'up to 60k weekly', style: TextStyle(color: AppTheme.dangerColor, backgroundColor: AppTheme.dangerBgColor, fontWeight: FontWeight.bold)),
                        const TextSpan(text: ' with just '),
                        TextSpan(text: '2 hours of work', style: TextStyle(color: AppTheme.dangerColor, backgroundColor: AppTheme.dangerBgColor, fontWeight: FontWeight.bold)),
                        const TextSpan(text: ' per day. No experience needed, just WhatsApp us now...'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(IconData icon, String text, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: textColor),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: textColor)),
        ],
      ),
    );
  }

  Widget _buildExplainItem(IconData icon, Color iconColor, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: iconColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 12),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.textPrimaryColor)),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
