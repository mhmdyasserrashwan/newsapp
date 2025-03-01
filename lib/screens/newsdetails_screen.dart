import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/articlenews.dart';
import 'package:newsapp/screens/web_view_screen.dart';
import 'package:shimmer/shimmer.dart';

class NewsdetailsScreen extends StatelessWidget {
  NewsdetailsScreen({super.key, required this.list});
  final Articles list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        title: Text(
          list.author ?? "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            //Padding(padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              clipBehavior: Clip.hardEdge,
              child: CachedNetworkImage(
                height: 200,
                width: double.infinity,
                imageUrl: list.urlToImage ?? "",
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade600,
                  highlightColor: Colors.grey.shade400,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              list.description ?? "",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              list.content ?? "",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Color(0xff1877F2),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => WebViewScreen(url: list.url ?? ""),
          ));
        },
        child: Text(
          'View more details .... ',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xff202020)),
        ),
      ),
    );
  }
}
