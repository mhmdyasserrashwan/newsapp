import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/articlenews.dart';
import 'package:newsapp/screens/newsdetails_screen.dart';
import 'package:shimmer/shimmer.dart';

class NewsItemWidget extends StatelessWidget {
  NewsItemWidget({super.key, required this.list});
  final Articles list;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NewsdetailsScreen(list: list),
        ));
      },
      child: Column(
        children: [
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
            height: 10,
          ),
          Text(
            list.title ?? "",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            list.author ?? "",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
