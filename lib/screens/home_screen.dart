import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "FΛMΣ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            letterSpacing: -1,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('threads')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          // Error
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Something went wrong.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          // Walang posts
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No threads yet. Be the first to post!',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          final threads = snapshot.data!.docs;

          return ListView.builder(
            itemCount: threads.length,
            itemBuilder: (context, index) {
              final data = threads[index].data() as Map<String, dynamic>;
              return PostCard(
                username: data['username'] ?? 'anonymous',
                avatarUrl: data['avatarUrl'] ??
                    'https://www.gravatar.com/avatar/?d=mp',
                content: data['content'] ?? '',
                imageUrl: data['imageUrl'],
              );
            },
          );
        },
      ),
    );
  }
}
