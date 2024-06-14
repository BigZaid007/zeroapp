
import 'package:appzero/view/Categories/BeinSport.dart';
import 'package:appzero/view/Categories/CartoonsContainer.dart';
import 'package:appzero/view/Categories/newsContainer.dart';
import 'package:flutter/material.dart';



import 'view/Categories/MoviesContainer.dart';
import 'view/Categories/SeriesContainer.dart';
import 'view/Categories/SportContainer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: Icon(Icons.tv,color: Colors.red,),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'HomeScreen',
          style: TextStyle(fontSize: 22,color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                beinSport(),
                SportContainer(),
                MoviesContainer(),
                SeriesContainer(),
                newsContainer(),
                CartoonsContainer()
          ]),
        ),
      ),
    );
  }
}
