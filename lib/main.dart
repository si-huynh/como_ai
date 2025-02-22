import 'package:como_ai/pages/video_feed_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Using dark theme for TikTok-like feel
      home: const VideoFeedScreen(),
    );
  }
}
