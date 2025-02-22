import 'package:flutter/material.dart';
import 'package:newsapp/apisfolder/newsapis.dart';
import 'model/sourceresponse.dart';
import 'homescreen.dart';

void main() async {
  // APIS api = new APIS();
  // SourcesResponse sources = await api.getSources();
  // //print(sources.sources!.length);
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
