import 'package:flutter/material.dart';
import '../theme.dart';
import 'results_screen.dart';

class AnalyzeScreen extends StatelessWidget {
  const AnalyzeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Analyze New\nOpportunity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Our AI Guardian will cross-reference this job post against known fraud patterns, deceptive salary ranges, and company reputation markers.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textSecondaryColor,
              ),
            ),
          ),
          const SizedBox(height: 32),

          // Job Description Box
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
                  children: const [
                    Icon(Icons.description, size: 16, color: AppTheme.primaryColor),
                    SizedBox(width: 8),
                    Text('JOB DESCRIPTION OR URL', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Paste the full job description or a link to the job post here...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Icon(Icons.info, size: 12, color: Colors.grey.shade600),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'The more text you provide, the higher the analysis accuracy.',
                        style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _buildLabel('JOB TITLE'),
          _buildTextField('e.g. Senior Product Designer'),
          
          _buildLabel('COMPANY NAME'),
          _buildTextField('e.g. TechCorp Solutions'),
          
          _buildLabel('SALARY RANGE'),
          _buildTextField('\$120k - \$150k'),
          
          _buildLabel('LOCATION'),
          _buildTextField('Remote / New York'),
          
          _buildLabel('EMPLOYMENT TYPE'),
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: AppTheme.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: 'Full-time',
                items: <String>['Full-time', 'Part-time', 'Contract', 'Freelance']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: const TextStyle(color: AppTheme.textSecondaryColor)),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),

          _buildLabel('CONTACT EMAIL'),
          _buildTextField('recruiter@company.com'),
          
          _buildLabel('JOB URL (OPTIONAL)'),
          _buildTextField('https://linkedin.com/jobs/...'),

          const SizedBox(height: 16),

          // Shield Ready Card
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
                  'Shield Ready',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildShieldFeature(Icons.verified_user, 'Verify hiring manager identity'),
                _buildShieldFeature(Icons.payments, 'Compare salary benchmarks'),
                _buildShieldFeature(Icons.link, 'Scan for phishing links'),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppTheme.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ResultsScreen()),
                      );
                    },
                    icon: const Icon(Icons.bolt),
                    label: const Text('Analyze Job', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),

          // Security Insights
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SECURITY INSIGHTS',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.textSecondaryColor),
                ),
                const SizedBox(height: 16),
                _buildInsight(
                  color: AppTheme.warningColor,
                  title: 'Common Fraud Warning',
                  desc: 'Unusually high entry-level salary detected in NY area.',
                ),
                _buildInsight(
                  color: AppTheme.dangerColor,
                  title: 'Data Leak Alert',
                  desc: 'Avoid sharing SSN or bank info before interviews.',
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.textSecondaryColor),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget _buildShieldFeature(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Icon(icon, color: Colors.white, size: 14),
          ),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildInsight({required Color color, required String title, required String desc}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.textPrimaryColor)),
                const SizedBox(height: 2),
                Text(desc, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
