import 'package:appzero/PlayerScreen.dart';
import 'package:appzero/apiChannels.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';




Widget newsContainer()
{
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text('News',style: TextStyle(
              fontSize: 26,
              letterSpacing: 2,
              fontWeight: FontWeight.w900
          ),),
        ),
        FutureBuilder<List<DataModel>>(
            future: fetchDataNews(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<DataModel> data = snapshot.data!;
                return Container(
                  height: 200,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      DataModel item = data[index];
                      return Column(
                        children: [
                          InkWell(
                            onTap:(){
                              Get.to(()=>PlayerScreen(item.url));
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  CachedNetworkImage(

                                    fit: BoxFit.contain,
                                    width: 100,
                                    height: 100, imageUrl: item.img,
                                  ), // Load the image from the 'img' property
                                ],
                              ),
                            ),
                          ),
                          Text(item.name)
                        ],
                      );
                    },
                  ),
                );
              }

              if (snapshot.hasError) {
                return Text('Error');
              }
              return Container();
            }),
      ]);
}

