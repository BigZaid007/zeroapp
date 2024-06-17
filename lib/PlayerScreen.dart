import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter/services.dart';

class PlayerScreen extends StatefulWidget {
  final String url;

  PlayerScreen(this.url);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    try {
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(widget.url),
        autoPlay: true,
      );
      setState(() {});
    } catch (e) {
      _showErrorDialog();
    }
  }

  @override
  void dispose() {
    Wakelock.disable();
    flickManager?.dispose();
    super.dispose();
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text('Failed to load the video.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: flickManager != null
            ? FlickVideoPlayer(
                flickManager: flickManager!,
                 flickVideoWithControlsFullscreen: FlickVideoWithControls(
            controls: FlickLandscapeControls(),
          ),
                flickVideoWithControls: FlickVideoWithControls(
                  controls: FlickPortraitControls(),
                ),
              )
            : Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
