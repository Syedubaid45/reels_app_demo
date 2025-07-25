import 'package:flutter/material.dart';
import 'package:reels_app_demo/reels/simple_video_player.dart';

class ReelsView extends StatelessWidget {
  ReelsView({super.key});

  final List<String> videoUrsl = [
    'https://cdn.pixabay.com/video/2024/03/31/206294_large.mp4',
    'https://cdn.pixabay.com/video/2025/06/09/284568_large.mp4',
    'https://cdn.pixabay.com/video/2025/03/23/266987_large.mp4',
    'https://cdn.pixabay.com/video/2023/03/08/153821-806526710_large.mp4',
    'https://cdn.pixabay.com/video/2025/06/03/283431_large.mp4',
    'https://cdn.pixabay.com/video/2024/08/30/228847_large.mp4',
    'https://cdn.pixabay.com/video/2025/04/29/275633_large.mp4',
    'https://cdn.pixabay.com/video/2025/05/13/278750_large.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videoUrsl.length,
        itemBuilder: (context, index) {
          return SimpleVideoPlayer(videoUrl: videoUrsl[index]);
        },
      ),
    );
  }
}
