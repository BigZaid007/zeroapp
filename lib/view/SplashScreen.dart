import 'package:appzero/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';


class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Start the 3 second delay
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to the homeScreen after the delay
      Get.to(()=>HomeScreen());
    });

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child:Image.asset('assets/logo.png')

    );
  }
}
