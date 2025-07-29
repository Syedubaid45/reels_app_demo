import 'package:flutter/material.dart';
import 'package:reels_app_demo/data/videos.dart';
import 'package:video_player/video_player.dart';

class SimpleVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const SimpleVideoPlayer({required this.videoUrl});

  @override
  State<SimpleVideoPlayer> createState() => _SimpleVideoPlayerState();
}

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

class _SimpleVideoPlayerState extends State<SimpleVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
            children: [
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  children: [
                    Text(
                      'Video Title',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Video Description',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Center(child: CircularProgressIndicator());
  }
}
