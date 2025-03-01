import 'package:flutter/material.dart';
import 'package:newsapp/model/sourceresponse.dart';

class TabitemWidget extends StatelessWidget {
  TabitemWidget({super.key, required this.src, required this.isSelected});
  Sources src;
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isSelected ? Color(0xff1877F2) : Colors.transparent,
          width: 2,
        ),
        color: Color(0xff1877F2),
      ),
      child: Text(
        src.name ?? "",
        style: TextStyle(
          fontSize: 18,
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
