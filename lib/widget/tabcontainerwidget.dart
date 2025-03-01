import 'package:flutter/material.dart';
import 'package:newsapp/model/sourceresponse.dart';
import 'package:newsapp/widget/tabitemwidget.dart';

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
      child: TabBar(
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
    );
  }
}
