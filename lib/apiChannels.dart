import 'dart:convert';
import 'package:flutter/services.dart';

class DataModel {
  final String name;
  final String url;
  final String img;

  DataModel({required this.name, required this.url, required this.img,});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      url: json['url'],
      img: json['img'],
    );
  }
}

Future<List<DataModel>> fetchDataNews() async {
  String jsonData = await rootBundle.loadString('assets/content.json');
  List<dynamic> jsonList = json.decode(jsonData);

  List<DataModel> data = jsonList.map((json) => DataModel.fromJson(json)).toList();

  return data;
}

Future<List<DataModel>> fetchBeinSport() async {
  String jsonData = await rootBundle.loadString('assets/beinSport.json');
  List<dynamic> jsonList = json.decode(jsonData);

  List<DataModel> data = jsonList.map((json) => DataModel.fromJson(json)).toList();

  return data;
}

Future<List<DataModel>> fetchSports() async {
  String jsonData = await rootBundle.loadString('assets/Sports.json');
  List<dynamic> jsonList = json.decode(jsonData);

  List<DataModel> data = jsonList.map((json) => DataModel.fromJson(json)).toList();

  return data;
}

Future<List<DataModel>> fetchMovies() async {
  String jsonData = await rootBundle.loadString('assets/Movies.json');
  List<dynamic> jsonList = json.decode(jsonData);

  List<DataModel> data = jsonList.map((json) => DataModel.fromJson(json)).toList();

  return data;
}

Future<List<DataModel>> fetchSeries() async {
  String jsonData = await rootBundle.loadString('assets/Series.json');
  List<dynamic> jsonList = json.decode(jsonData);

  List<DataModel> data = jsonList.map((json) => DataModel.fromJson(json)).toList();

  return data;
}







