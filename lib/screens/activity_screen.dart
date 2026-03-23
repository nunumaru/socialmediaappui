import 'package:flutter/material.dart';


class ActivityScreen extends StatelessWidget {
  ActivityScreen({super.key}); // ✅ idagdag ang const

  final List<Map<String, String>> activities = [
    {"username": "Claire", "action": "liked your post."},
    {"username": "Fin", "action": "commented: Nice shot!"},
    {"username": "Tricia", "action": "started following you."},
    {"username": "Jeiah", "action": "liked your photo."},
    {"username": "Alex", "action": "mentioned you in a comment."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity"),
      ),
      body: ListView.builder(
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];

          return ListTile(
            leading: const CircleAvatar(
              radius: 25,
            ),
            title: Text(
              "${activity["username"]} ${activity["action"]}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ActivityDetailScreen(
                    username: activity["username"]!,
                    action: activity["action"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ActivityDetailScreen extends StatelessWidget {
  final String username;
  final String action;

  const ActivityDetailScreen({
    super.key,
    required this.username,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activity Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const CircleAvatar(radius: 30),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                "$username $action",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
