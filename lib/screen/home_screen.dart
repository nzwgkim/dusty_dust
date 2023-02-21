import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/hourly_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/const/data.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    final response = await Dio().get(
        'http://apis.data.go.kr/B552584/ArpltnStatsSvc/getCtprvnMesureLIst',
        queryParameters: {
          'serviceKey': serviceKey,
          'returnType': 'json',
          'numOfRows': 30,
          'pageNo': 1,
          'itemCode': 'PM10',
          'dataGubun': 'HOUR',
          'searchCondition': 'WEEK',
        });
    // body는 response의 data로 받을 수 있다.
    final body = response.data;
    print(body);
  }

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
              children: const [
                CategoryCard(),
                SizedBox(
                  height: 8,
                ),
                HourlyCard(),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
