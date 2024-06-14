import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

class PlayerScreen extends StatefulWidget {
  final String url;

  PlayerScreen(this.url);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  VideoPlayerController? controller;
  bool isPlaying = true;

  @override
  void initState() {
    super.initState();
    initializePlayer();
    Wakelock.enable();
  }

  Future<void> initializePlayer() async {
    controller = VideoPlayerController.network(widget.url);
    await controller!.initialize();
    controller!.play();
    setState(() {}); // Trigger a rebuild after initialization
  }

  @override
  void dispose() {
    Wakelock.disable();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            Wakelock.disable();
            controller!.dispose();
          },
          child: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: controller != null && controller!.value.isInitialized
          ? InkWell(
        onTap: () {
          controller!.pause();
        },
        onDoubleTap: () {
          controller!.play();
        },
        child: Center(
          child: AspectRatio(
            aspectRatio: 8 / 6,
            child: VideoPlayer(controller!),
          ),
        ),
      )
          : Center(child: CircularProgressIndicator(
        strokeWidth: 1,
        color: Colors.white,
      )),
    );
  }
}
