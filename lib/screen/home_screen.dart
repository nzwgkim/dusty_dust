import 'package:dusty_dust/component/category_card.dart';
import 'package:dusty_dust/component/hourly_card.dart';
import 'package:dusty_dust/component/main_app_bar.dart';
import 'package:dusty_dust/component/main_drawer.dart';
import 'package:dusty_dust/const/colors.dart';
import 'package:dusty_dust/const/region.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:dusty_dust/repository/stat_repository.dart';
import 'package:dusty_dust/utils/data_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String region = regions[0];
  Future<List<StatModel>> fetchData() async {
    final statModels = await StatRepository.fetchData();

    return statModels;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      drawer: MainDrawer(
        selectedRegion: region,
        onRegionTap: (String region) {
          setState(() {
            this.region = region;
          });
          Navigator.of(context).pop();
        },
      ),
      body: FutureBuilder<List<StatModel>>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // 에러가 있을때
            return const Center(
              child: Text('에러가 있습니다.'),
            );
          }

          if (!snapshot.hasData) {
            // 로딩상태
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<StatModel> stats = snapshot.data!;
          StatModel recentStat = stats[0];

          // 1 - 5, 6 - 10, 11 - 15
          // 7
          final status = DataUtils.getStatusFromItemCodeAndValue(
            value: recentStat.seoul,
            itemCode: ItemCode.PM10,
          );

          return CustomScrollView(
            slivers: [
              MainAppBar(
                region: region,
                stat: recentStat,
                status: status,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    CategoryCard(),
                    SizedBox(height: 16.0),
                    HourlyCard(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
