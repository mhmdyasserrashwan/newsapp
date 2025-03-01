import 'package:flutter/material.dart';
import 'package:newsapp/apisfolder/newsapis.dart';
import 'package:newsapp/model/sourceresponse.dart';
import 'package:newsapp/widget/tabcontainerwidget.dart';
//import 'package:newsapp/widget/tabitemwidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  List<Sources> srclist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        title: Text(
          'News',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: APIS.getSources(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'ERROR',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Color(0xff1877F2),
              ),
            );
          }
          var listSource = snapshot.data?.sources ?? [];
          return TabContainerWidget(sourceList: listSource);
        },
      ),
    );
  }
}
