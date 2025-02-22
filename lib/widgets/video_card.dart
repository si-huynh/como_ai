import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  final String videoAsset;
  final String username;
  final String description;

  const VideoCard({
    super.key,
    required this.videoAsset,
    required this.username,
    required this.description,
  });

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.asset(widget.videoAsset);
    await _controller.initialize();
    await _controller.setLooping(true);
    await _controller.play();
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Video container
        Center(
          child:
              _isInitialized
                  ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                  : const CircularProgressIndicator(),
        ),

        // Video controls overlay (tap to play/pause)
        GestureDetector(
          onTap: () {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          },
        ),

        // Right side buttons (like, comment, share)
        Positioned(
          right: 16,
          bottom: 100,
          child: Column(
            children: [
              _buildSideButton(Icons.favorite, '23.5K'),
              const SizedBox(height: 20),
              _buildSideButton(Icons.comment, '1.2K'),
              const SizedBox(height: 20),
              _buildSideButton(Icons.share, 'Share'),
            ],
          ),
        ),

        // Bottom user info and description
        Positioned(
          left: 16,
          right: 72,
          bottom: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@${widget.username}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 4),
              Text(
                widget.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSideButton(IconData icon, String label) {
    return Column(
      children: [Icon(icon, size: 32), SizedBox(height: 4), Text(label)],
    );
  }
}

class VideoItem {
  final String videoAsset;
  final String username;
  final String description;

  VideoItem({
    required this.videoAsset,
    required this.username,
    required this.description,
  });
}
