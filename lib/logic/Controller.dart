import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:video_player/video_player.dart';

class controller extends GetxController
{

}



class PlayerController extends GetxController {
  FlickManager? flickManager;

  Future<void> initializePlayer(String url) async {
    try {
      flickManager = FlickManager(

        videoPlayerController: VideoPlayerController.network(url),
        autoPlay: true, // Disable autoplay
      );
      update();
    } catch (e) {
      _showErrorDialog();
    }
  }

  void disposePlayer() {
    flickManager?.dispose();
  }

  void _showErrorDialog() {
    Get.defaultDialog(
      title: 'Error',
      content: Text('Failed to load the video.'),
      onConfirm: () {
        Get.back();
        Get.back();
      },
      textConfirm: 'OK',
    );
  }
}
