import 'package:appzero/logic/Controller.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:wakelock/wakelock.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlayerScreen extends StatefulWidget {
  final String url;

  PlayerScreen(this.url);

  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  final PlayerController playerController = Get.put(PlayerController());

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    playerController.initializePlayer(widget.url);
  }

  @override
  void dispose() {
    Wakelock.disable();
    playerController.disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            playerController.disposePlayer();
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: GetBuilder<PlayerController>(
          builder: (controller) {
            return controller.flickManager != null
                ? Center(
                  child: Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width ,
                    child: FlickVideoPlayer(
                        flickManager: controller.flickManager!,
                        flickVideoWithControlsFullscreen: FlickVideoWithControls(
                          
                          controls: FlickLandscapeControls(
                          
                          
                          ),
                        ),
                        flickVideoWithControls: FlickVideoWithControls(
                          controls: FlickPortraitControls(
                            
                          ),
                        ),
                      ),
                  ),
                )
                : Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: Colors.white,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
