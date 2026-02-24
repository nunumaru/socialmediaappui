  import 'package:flutter/material.dart';
  import '../widgets/post_card.dart';

  class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
      final posts = [
        {
          "username": "taylor swift ✅️",
          "avatar":
          "https://th.bing.com/th/id/OIP.d4YZc_yrnzWuztb7FCPz6gHaHa?w=208&h=209&c=7&r=0&o=7&pid=1.7&rm=3",
          "content":
          "Life's a song, and I'm here to sing it loud 🎶 Let the melody carry me where my words cannot.",
          "image":
          "https://tse1.mm.bing.net/th/id/OIP.K9wX7cPg-Em9-0-VWhu0rwHaEK?w=1600&h=900&rs=1&pid=ImgDetMain&o=7&rm=3"
        },
        {
          "username": "kyliejenner ✅️",
          "avatar":
          "https://tse1.mm.bing.net/th/id/OIP.Yet1YXnK6cG9TwO0VrH7cwHaJh?pid=ImgDet&w=206&h=264&c=7&o=7&rm=3",
          "content": "Life is better in a bikini 👙💃",
          "image":
          "https://www.usmagazine.com/wp-content/uploads/2025/05/Kylie-Jenner-Rocks-Hot-Pink-Bikini-on-Turks-and-Caicos-Trip-Without-Timothee-780.jpg?quality=86&strip=all"
        },
        {
          "username": "bruno marsu ✅️",
          "avatar":
          "https://tse2.mm.bing.net/th/id/OIP.1goUnMnjJ-CMvadUnky60gHaHa?rs=1&pid=ImgDetMain&o=7&rm=3",
          "content": "just vibin'",
          "image":
          "https://tse2.mm.bing.net/th/id/OIP.4QCm6q4gUK6SlKIP8ti6mQAAAA?rs=1&pid=ImgDetMain&o=7&rm=3"
        },
        {
          "username": "zayn malik ✅️",
          "avatar":
          "https://th.bing.com/th/id/OIP.3BCIVUzuPUgOdL3hvPbkDAHaHa?w=178&h=180&c=7&r=0&o=7&pid=1.7&rm=3",
          "content": " vas happenin' everyone",
          "image":
          "https://th.bing.com/th?id=OIF.pXud%2fBgwP%2bDO28r37MrLOA&w=326&h=181&c=7&r=0&o=7&pid=1.7&rm=3"
        },
        {
          "username": "WALLY BAYOLA ",
          "avatar":
          "https://th.bing.com/th/id/OIP.AxpLNd8oacZGRFnjbVexIgHaD4?w=344&h=181&c=7&r=0&o=7&pid=1.7&rm=3",
          "content": " Parang Dao Ming Si",
          "image":
          "data:image/webp;base64,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"
        }
      ];

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            "FΛMΣ",
            style: TextStyle(
              color: Colors.white,   // <-- make text white
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostCard(
              username: post["username"]!,
              avatarUrl: post["avatar"]!,
              content: post["content"]!,
              imageUrl: post["image"],
            );
          },
        ),
      );
    }
  }