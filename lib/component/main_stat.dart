import 'package:flutter/material.dart';

class MainStat extends StatelessWidget {
  //미세먼지, 초미세먼지
  final String category;
// 위치
  final String imgPath;
  final String level;
  final String stat;
  final double width;

  const MainStat(
      {required this.category,
      required this.imgPath,
      required this.level,
      required this.stat,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    const ts = TextStyle(color: Colors.black);
    return SizedBox(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category,
            style: ts,
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            imgPath,
            width: 50,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            level,
            style: ts,
          ),
          Text(
            stat,
            style: ts,
          ),
        ],
      ),
    );
  }
}
