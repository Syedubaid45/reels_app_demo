import 'package:flutter/material.dart';
import 'package:reels_app_demo/data/videos.dart';
import 'package:reels_app_demo/reels/simple_video_player.dart';

class ReelsView extends StatefulWidget {
  ReelsView({super.key});

  @override
  State<ReelsView> createState() => _ReelsViewState();
}

class _ReelsViewState extends State<ReelsView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: videos.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            final video = videos[index];
            return SimpleVideoPlayer(
              video: video,
              isPlaying: index == _currentPage,
            );
          },
        ),
      ),
    );
  }
}
