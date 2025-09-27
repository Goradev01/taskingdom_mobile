import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskingdom/presentation/general_widget/app_scaffold.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 22),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              _NotificationCard(
                icon: Icons.workspace_premium_rounded,
                iconBg: Color(0xFFFAE6F0),
                title: 'VIP Status Update',
                message: 'Your VIP membership is now active. Enjoy increased rewards and tournament access.',
                date: 'May 5, 7:30AM',
                cardColor: Color(0xFFFBD0E0),
              ),
              const SizedBox(height: 12),
              _NotificationCard(
                icon: Icons.sports_esports_rounded,
                iconBg: Color(0xFFE6F0FA),
                title: 'New Tournament Available',
                message: 'Legends Arena is now live. Join now to win exclusive rewards.',
                date: 'May 5, 7:30AM',
                cardColor: Color(0xFFD0E6FB),
              ),
              const SizedBox(height: 12),
              _NotificationCard(
                icon: Icons.check_circle_rounded,
                iconBg: Color(0xFFE6FAE6),
                title: 'Task Completed',
                message: 'You have completed Elite Challenge and earned 1500 bonus points',
                date: 'May 5, 7:30AM',
                cardColor: Color(0xFFD0FBD8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final String title;
  final String message;
  final String date;
  final Color cardColor;

  const _NotificationCard({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.message,
    required this.date,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(icon, size: 28, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
                const SizedBox(height: 8),
                Text(
                  date,
                  style: TextStyle(fontSize: 11, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
