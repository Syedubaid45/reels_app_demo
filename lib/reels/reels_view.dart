import 'package:flutter/material.dart';
import 'package:reels_app_demo/data/videos.dart';
import 'package:reels_app_demo/reels/simple_video_player.dart';

class ReelsView extends StatelessWidget {
  ReelsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];
          return SimpleVideoPlayer(video: video);
        },
      ),
    );
  }
}
