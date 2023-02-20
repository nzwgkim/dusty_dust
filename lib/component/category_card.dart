import 'package:dusty_dust/component/main_stat.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        color: lightColor,
        child: LayoutBuilder(builder: (p0, p1) {
          // p0: buildContext, p1: constraint
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  decoration: const BoxDecoration(
                      color: darkColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      '종류별 통계',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  )),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  // 사용자의 scroll입력이 page 단위로 적용됨
                  physics: const PageScrollPhysics(),
                  children: List.generate(
                    20,
                    (index) => MainStat(
                        //LayoutBuilder의 constraint를 통해,
                        //layout의 크기 정보를 얻을 수 있다.
                        width: p1.maxWidth / 3,
                        category: '미세먼지',
                        imgPath: 'asset/img/best.png',
                        level: '최고',
                        stat: '0 ㎍/㎥'),

                    /// MainStat
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
