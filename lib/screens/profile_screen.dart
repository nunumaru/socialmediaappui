import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {  // ✅ Renamed from ProfilePage → ProfileScreen
  const ProfileScreen({super.key});           // ✅ Added const constructor

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {  // ✅ Renamed state class too
  String username = 'AceCamandona';
  String bio = 'Edit your bio here...';
  bool isEditingBio = false;
  late TextEditingController bioController;
  List<String> posts = [
    'Hello, this is my first thread!',
    'Flutter is awesome!',
    'What do you think about Dart?',
  ];

  @override
  void initState() {
    super.initState();
    bioController = TextEditingController(text: bio);
  }

  @override
  void dispose() {
    bioController.dispose();
    super.dispose();
  }

  void editBio() {
    setState(() {
      isEditingBio = true;
      bioController.text = bio;
    });
  }

  void saveBio() {
    setState(() {
      bio = bioController.text;
      isEditingBio = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$username\'s Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/74826509?v=4',
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  username,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: isEditingBio
                      ? TextField(
                    controller: bioController,
                    maxLines: null,
                  )
                      : Text(
                    bio,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                  icon: Icon(isEditingBio ? Icons.save : Icons.edit),
                  onPressed: isEditingBio ? saveBio : editBio,
                ),
              ],
            ),
            const Divider(height: 32),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Threads',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) => Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/74826509?v=4',
                      ),
                    ),
                    title: Text(username),
                    subtitle: Text(posts[index]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
