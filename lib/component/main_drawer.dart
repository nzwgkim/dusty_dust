import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

const regions = [
  '서울',
  '경기',
  '대구',
  '충남',
  '인천',
  '대전',
  '경북',
  '세종',
  '광주',
  '전북',
  '강원',
  '울산',
  '전남',
  '부산',
  '제주',
  '충북',
  '경남'
];

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkColor,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text(
              'Select a region',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          ...regions
              .map(
                (e) => ListTile(
                  tileColor: Colors.white,
                  selectedTileColor: lightColor, // 선택된 상태의 배경색
                  selectedColor: Colors.black, // 선택된 상태의 글자색
                  selected:
                      e == '서울', // selectedTileColor&selectedColor 를 반영할 것인지.
                  onTap: () {},
                  title: Text(e),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
