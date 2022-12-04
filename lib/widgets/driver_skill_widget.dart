import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DriverSkillBar extends StatelessWidget {
  var skillText = "null";

  DriverSkillBar({super.key,this.skillText = "null"});

  @override
  Widget build(BuildContext context) {
    double phoneHeight = MediaQuery.of(context).size.height;
    double phoneWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).highlightColor,
          borderRadius: BorderRadius.circular(3)),
      height: phoneHeight * 0.3,
      width: phoneWidth * 0.1,
      child: Center(
        child: Text(
          skillText,
          style: TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }
}