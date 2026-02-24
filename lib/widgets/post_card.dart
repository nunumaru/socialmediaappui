import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final String content;
  final String? imageUrl;

  const PostCard({
    super.key,
    required this.username,
    required this.avatarUrl,
    required this.content,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 22, backgroundImage: NetworkImage(avatarUrl)),
              const SizedBox(width: 12),
              Text(
                username,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(content),
          if (imageUrl != null) ...[
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl!),
            ),
          ],
          const SizedBox(height: 8),
          Row(
            children: const [
              Icon(Icons.favorite_border, size: 20),
              SizedBox(width: 16),
              Icon(Icons.mode_comment_outlined, size: 20),
              SizedBox(width: 16),
              Icon(Icons.repeat, size: 20),
              SizedBox(width: 16),
              Icon(Icons.send, size: 20),
            ],
          ),
          const Divider(color: Colors.grey)
        ],
      ),
    );
  }
}