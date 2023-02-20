import 'package:dusty_dust/component/card_title.dart';
import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_card.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      backgroundColor: primaryColor,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          const MainAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CategoryCard(),
                const SizedBox(
                  height: 8,
                ),
                MainCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CardTitle(title: '시간별 미세먼지'),
                      Column(
                        children: List.generate(24, (index) {
                          final now = DateTime.now();
                          final hour = now.hour;
                          var currenthour = hour - index;
                          if (currenthour < 0) {
                            currenthour += 24;
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                      '${currenthour.toString().padLeft(2, '0')} 시'),
                                ),
                                Expanded(
                                  child: Image.asset(
                                    'asset/img/good.png',
                                    height: 20,
                                  ),
                                ),
                                const Expanded(
                                    child: Text(
                                  '맑음',
                                  textAlign: TextAlign.right,
                                ))
                              ],
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
