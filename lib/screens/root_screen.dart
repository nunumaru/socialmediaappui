import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'create_thread_screen.dart';
import 'activity_screen.dart';
import 'profile_screen.dart';
import '../widgets/bottom_nav.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeScreen(), // always show home feed
      bottomNavigationBar: BottomNav(), // UI-only bottom icons
    );
  }
}