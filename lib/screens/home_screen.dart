import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.menu, color: Colors.white, size: 24),
          ),
        ),
        title: const Text(
          'FΛMΣ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.search, color: Colors.white, size: 24),
            ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('threads')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          final threads = snapshot.hasData ? snapshot.data!.docs : [];

          return ListView.builder(
            itemCount: threads.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Color(0xFF2A2A2A))),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0xFF2A2A2A),
                        child: Icon(Icons.person,
                            color: Colors.grey, size: 18),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "What's new?",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFF2A2A2A)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Post',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                );
              }

              final data = threads[index - 1].data() as Map<String, dynamic>;
              return PostCard(
                username: data['username'] ?? 'anonymous',
                avatarUrl: data['avatarUrl'] ?? '',
                content: data['content'] ?? '',
                imageUrl: data['imageUrl'],
                timeAgo: _getTimeAgo(data['createdAt']),
              );
            },
          );
        },
      ),
    );
  }

  String _getTimeAgo(dynamic timestamp) {
    if (timestamp == null) return '';
    final now = DateTime.now();
    final createdAt = (timestamp as Timestamp).toDate();
    final diff = now.difference(createdAt);

    if (diff.inSeconds < 60) return '${diff.inSeconds}s';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return '${diff.inDays}d';
  }
}
