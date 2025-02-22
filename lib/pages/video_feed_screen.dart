import 'package:como_ai/widgets/video_card.dart';
import 'package:flutter/material.dart';

class VideoFeedScreen extends StatefulWidget {
  const VideoFeedScreen({super.key});

  @override
  State<VideoFeedScreen> createState() => _VideoFeedScreenState();
}

class _VideoFeedScreenState extends State<VideoFeedScreen> {
  final List<VideoItem> _videoItems = [
    VideoItem(
      videoAsset: 'assets/videos/video1.mp4',
      username: 'Harley Trung',
      description: 'Build app with Replit in one minute',
    ),
    VideoItem(
      videoAsset: 'assets/videos/video2.mp4',
      username: 'Cuong Chung',
      description: 'Conduct effective sprint retros using Confluence and Jira',
    ),
    VideoItem(
      videoAsset: 'assets/videos/video3.mp4',
      username: 'Leo Do',
      description: 'Diffusion Bee - Stable Diffusion GUI App for MacOS',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _videoItems.length,
        itemBuilder: (context, index) {
          final videoItem = _videoItems[index];
          return VideoCard(
            videoAsset: videoItem.videoAsset,
            username: videoItem.username,
            description: videoItem.description,
          );
        },
      ),
    );
  }
}
