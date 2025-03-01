import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() async {
  // APIS api = new APIS();
  // SourcesResponse sources = await api.getSources();
  // //print(sources.sources!.length);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
