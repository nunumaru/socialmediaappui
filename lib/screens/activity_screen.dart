import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateThreadScreen extends StatefulWidget {
  const CreateThreadScreen({super.key});

  @override
  State<CreateThreadScreen> createState() => _CreateThreadScreenState();
}

class _CreateThreadScreenState extends State<CreateThreadScreen> {
  final TextEditingController _threadController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isPosting = false;

  Future<void> _postThread() async {
    if (_threadController.text.isEmpty) return;

    setState(() => _isPosting = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance.collection('threads').add({
        'content': _threadController.text.trim(),
        'username': user?.email ?? 'anonymous',
        'userId': user?.uid,
        'createdAt': FieldValue.serverTimestamp(),
        'likes': 0,
        'replies': 0,
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Thread Posted!")),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    } finally {
      setState(() => _isPosting = false);
    }
  }

  @override
  void dispose() {
    _threadController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        leadingWidth: 80,
        title: const Text(
          "New thread",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        // ✅ Tinanggal na ang dalawang icons
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text(
                                  "cheifuu",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.chevron_right,
                                    color: Colors.grey, size: 20),
                                const SizedBox(width: 4),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Add a topic",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: _threadController,
                              focusNode: _focusNode,
                              maxLines: null,
                              autofocus: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "What's new?",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.zero,
                              ),
                              onChanged: (value) => setState(() {}),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                _buildIconButton(Icons.image_outlined),
                                _buildIconButton(Icons.gif_box_outlined),
                                _buildIconButton(Icons.emoji_emotions_outlined),
                                _buildIconButton(Icons.format_list_bulleted),
                                _buildIconButton(Icons.note_outlined),
                                _buildIconButton(Icons.location_on_outlined),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.grey.shade800,
                        child: const Icon(Icons.person,
                            color: Colors.grey, size: 16),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Add to thread",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey.shade800, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.public, color: Colors.grey.shade600, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      "Reply options",
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 14),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: _threadController.text.isNotEmpty && !_isPosting
                      ? _postThread
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    disabledBackgroundColor: Colors.grey.shade800,
                    disabledForegroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 8),
                  ),
                  child: _isPosting
                      ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.black,
                    ),
                  )
                      : const Text(
                    "Post",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {},
        child: Icon(icon, color: Colors.grey, size: 24),
      ),
    );
  }
}
