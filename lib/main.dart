import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'screen/home_screen.dart';

const testBox = 'test';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(testBox);

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
