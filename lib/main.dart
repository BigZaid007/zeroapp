import 'package:appzero/view/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main()
{
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: splashScreen(),
    );
  }
}
