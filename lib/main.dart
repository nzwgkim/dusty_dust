import 'package:dusty_dust/screen/test_screen.dart';
import 'package:dusty_dust/model/stat_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screen/home_screen.dart';

const testBox = 'test';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(testBox);

  Hive.registerAdapter<StatModel>(StatModelAdapter());
  Hive.registerAdapter<ItemCode>(ItemCodeAdapter());

  for (ItemCode itemCode in ItemCode.values) {
    await Hive.openBox(itemCode.name);
  }

  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'sunflower',
    ),
    home:
        // const TestScreen(),
        const HomeScreen(),
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: 'sunflower',
//       ),
//       home:  TestScreen(),
//       // const HomeScreen(),
//     );
//   }
// }
