import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Activity")),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(),
            title: Text("user123 liked your post"),
          ),
          Divider(),
          ListTile(
            leading: CircleAvatar(),
            title: Text("john replied to your thread"),
          ),
        ],
      ),
    );
  }
}