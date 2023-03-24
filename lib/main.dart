import 'package:dusty_dust/screen/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
    home: const TestScreen(),
    // const HomeScreen(),
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
