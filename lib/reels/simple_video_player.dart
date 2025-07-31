import 'package:flutter/material.dart';
import 'package:reels_app_demo/data/videos.dart';
import 'package:video_player/video_player.dart';

class SimpleVideoPlayer extends StatefulWidget {
  final Map<String, String> video;
  const SimpleVideoPlayer({super.key, required this.video});

  @override
  State<SimpleVideoPlayer> createState() => _SimpleVideoPlayerState();
}

// final List<String> videoUrsl = [
//   'https://cdn.pixabay.com/video/2024/03/31/206294_large.mp4',
//   'https://cdn.pixabay.com/video/2025/06/09/284568_large.mp4',
//   'https://cdn.pixabay.com/video/2025/03/23/266987_large.mp4',
//   'https://cdn.pixabay.com/video/2023/03/08/153821-806526710_large.mp4',
//   'https://cdn.pixabay.com/video/2025/06/03/283431_large.mp4',
//   'https://cdn.pixabay.com/video/2024/08/30/228847_large.mp4',
//   'https://cdn.pixabay.com/video/2025/04/29/275633_large.mp4',
//   'https://cdn.pixabay.com/video/2025/05/13/278750_large.mp4',
// ];

class _SimpleVideoPlayerState extends State<SimpleVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    final url = widget.video['videoUrl'];
    if (url == null || url.isEmpty) {
      throw Exception('Video URL is missing or empty');
    }

    _controller = VideoPlayerController.network(url)
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
                bottom: 90,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.comment, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.share, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.save_alt, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.video['videoTitle']!}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '${widget.video['description']!}',
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
        : Center(
            child: CircularProgressIndicator(color: Colors.deepOrangeAccent),
          );
  }
}
