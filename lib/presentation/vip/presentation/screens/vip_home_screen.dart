import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/dashboard.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/profile/profile_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/screens/tournament_screen.dart';
import 'package:taskingdom/presentation/vip/presentation/widgets/nav_bar.dart';

 

class VipHomeScreen extends ConsumerWidget {
  const VipHomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: IndexedStack(
               index: ref.watch(currentIndexProvider),
        children: [
      VipDashboard(),
       TournamentScreen(),
       ProfileScreen(),
        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/avatar_placeholder.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Hi, Adewale 👋', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 2),
                Text('Welcome', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none)),
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(color: const Color(0xFF2ECC71), borderRadius: BorderRadius.circular(8)),
              child: const Text('VIP Active', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
            )
          ],
        )
      ],
    );
  }

  Widget _buildPointsCard(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF0F9D58), Color(0xFF0C6B4F)]),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 6))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Points Summary', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              Row(children: const [Icon(Icons.star, color: Colors.yellow), SizedBox(width: 6), Text('80', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))])
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(value: 0.45, minHeight: 10, backgroundColor: Colors.white24, valueColor: const AlwaysStoppedAnimation(Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          // Replace with your hero image asset
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: Image.asset('assets/vip_home_screen.png', fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Manchester United', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('defeat Villa on final day', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                Row(
                  children: [
                    _iconInfo(Icons.favorite, '1.2k'),
                    const SizedBox(width: 8),
                    _iconInfo(Icons.comment, '345'),
                    const SizedBox(width: 8),
                    _iconInfo(Icons.share, '89'),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _iconInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white70)),
      ],
    );
  }

  Widget _sectionTitle(String title, {String? action}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        if (action != null) Text(action, style: TextStyle(color: Colors.orange.shade400, fontWeight: FontWeight.w600))
      ],
    );
  }

  Widget _buildCompletedTasks() {
    final tasks = [
      {'title': 'Post IG Story for Nike', 'sub': 'Jun 20 2025'},
      {'title': 'Like facebook page', 'sub': 'Jun 20 2025'},
      {'title': 'Follow our social page', 'sub': 'Jun 20 2025'},
    ];

    return Column(
      children: tasks.map((t) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 8)]),
          child: Row(
            children: [
              const CircleAvatar(child: Icon(Icons.check, color: Colors.white), backgroundColor: Color(0xFF2ECC71)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(t['title']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 6),
                    Text(t['sub']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
              Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(8)), child: const Text('Completed', style: TextStyle(color: Colors.green)))
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAvailableTasks(Size size) {
    final items = [
      {'title': 'Share our social page', 'points': '10 points', 'date': '15/05/2025'},
      {'title': 'Watch a video', 'points': '10 points', 'date': '15/05/2025'},
      {'title': 'Post a review', 'points': '15 points', 'date': '18/05/2025'},
    ];

    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final it = items[index];
          return Container(
            width: size.width * 0.62,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Container(height: 70, color: Colors.grey.shade300, child: Image.asset('assets/task_placeholder.png', fit: BoxFit.cover)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(it['title']!, style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(it['points']!, style: const TextStyle(fontWeight: FontWeight.w600)),
                          Text(it['date']!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTournamentCard(BuildContext context, String title, String host, {bool online = true}) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
      child: Column(
        children: [
          // image area
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
            child: Container(height: 160, color: Colors.grey.shade300, child: Image.asset('assets/tournament_placeholder.png', fit: BoxFit.cover)),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Text(host, style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    Row(children: const [Icon(Icons.emoji_events, size: 18), SizedBox(width: 6), Text('5000 points', style: TextStyle(fontWeight: FontWeight.bold))])
                  ]),
                ),
                Column(
                  children: [
                    ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))), child: const Text('Join & Play')),
                    const SizedBox(height: 8),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6), decoration: BoxDecoration(color: online ? Colors.green : Colors.grey.shade400, borderRadius: BorderRadius.circular(8)), child: Text(online ? 'ONLINE' : 'UNAVAILABLE', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home, 'Home', active: true),
          _navItem(Icons.videogame_asset, 'Tournament'),
          _navItem(Icons.person_outline, 'Profile'),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, String label, {bool active = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: active ? Colors.orange : Colors.grey),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: active ? Colors.orange : Colors.grey, fontSize: 12))
      ],
    );
  }
}
