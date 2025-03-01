import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/apisfolder/newsapis.dart';
import 'package:newsapp/model/articlenews.dart';
import 'package:newsapp/model/sourceresponse.dart';
import 'package:newsapp/widget/newsitemWidget.dart';
import 'package:newsapp/widget/tabitemwidget.dart';
import 'package:shimmer/shimmer.dart';

class TabContainerWidget extends StatefulWidget {
  TabContainerWidget({super.key, required this.sourceList});
  List<Sources> sourceList;

  @override
  State<TabContainerWidget> createState() => _TabContainerWidgetState();
}

class _TabContainerWidgetState extends State<TabContainerWidget> {
  int itemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              itemIndex = index;
              setState(() {});
            },
            tabs: widget.sourceList
                .map((source) => TabitemWidget(
                      src: source,
                      isSelected: itemIndex == widget.sourceList.indexOf(source)
                          ? true
                          : false,
                    ))
                .toList(),
            isScrollable: true,
          ),
          FutureBuilder(
              future: APIS.getArticles(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'ERROR',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
                var articleList = snapshot.data?.articles ?? [];
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      height: 10,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                    itemCount: articleList.length,
                    itemBuilder: (context, index) {
                      return NewsItemWidget(
                        list: articleList[index],
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
