
import 'dart:convert';

import 'package:appzero/PlayerScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class ParseVideo extends StatefulWidget {
  const ParseVideo({Key? key}) : super(key: key);

  @override
  _ParseVideoState createState() => _ParseVideoState();
}

class _ParseVideoState extends State<ParseVideo> {
  List<String> videoUrls = [];

  @override
  void initState() {
    super.initState();
  }


  Future<List<String>> _fetchData() async {
    final url = 'https://alifaleh.github.io/iptv_channels/vodu.m3u';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final lines = response.body.split('\n');
      final m3u8Urls = <String>[];

      for (final line in lines) {
        if (line.trim().startsWith('http') && line.trim().endsWith('.m3u8')) {
          m3u8Urls.add(line.trim());
        }
      }


      setState(() {
        videoUrls=m3u8Urls;
      });
      print(response.body);
      return m3u8Urls;
    } else {
      print('Failed to load M3U data');
      return [];
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M3U Playlist'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          InkWell(
              onTap: (){
                print(videoUrls[0]);
                Get.to(()=>PlayerScreen('http://stream.shabakaty.com:6001/news/ch23/ch23_720.m3u8'));
              },
              child: Text('Go to player'))
          ,

          InkWell(
            onTap: () async {
              await _fetchData();

              // String u=videoUrls.toString();
              // print(u);
              // if(u.isNotEmpty)
              //   Get.to(()=>PlayerScreen(u));
            },
            child: Container(
              color: Colors.red,
              width: 500,
              height: 200,
              child: Text('Click me'),
            ),
          ),

        ],
      )


    );
  }
}
