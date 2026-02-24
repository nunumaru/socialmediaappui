import 'package:flutter/material.dart';

class CreateThreadScreen extends StatelessWidget {
  const CreateThreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Thread")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Start a thread...",
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}