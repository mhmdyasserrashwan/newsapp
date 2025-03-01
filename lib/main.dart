import 'package:flutter/material.dart';
import 'package:newsapp/apisfolder/newsapis.dart';
import 'screens/homescreen.dart';

void main() async {
  // APIS api = new APIS();
  // SourcesResponse sources = await api.getSources();
  // //print(sources.sources!.length);
  APIS.getArticles();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
