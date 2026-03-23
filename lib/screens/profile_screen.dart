import 'package:flutter/material.dart';
import '../widgets/post_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("username"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          CircleAvatar(radius: 40),

          SizedBox(height: 12),

          Text(
            "username",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 4),

          Text("Bio goes here..."),

          SizedBox(height: 20),

          Divider(),

          PostCard(
            username: "taylor swift",
            avatarUrl:
            "https://images.hdqwalls.com/wallpapers/2018-taylor-swift-9v.jpg",
            content: "Check out my new album single!",
            imageUrl:
            "https://tse1.mm.bing.net/th/id/OIP.K9wX7cPg-Em9-0-VWhu0rwHaEK?w=1600&h=900&rs=1&pid=ImgDetMain&o=7&rm=3",
          ),

          PostCard(
            username: "bruno marsu",
            avatarUrl: "https://i.pravatar.cc/150?img=2",
            content: "Flutter makes UI development so fast!",
            imageUrl: null,
          ),
        ],
      ),
    );
  }
}
