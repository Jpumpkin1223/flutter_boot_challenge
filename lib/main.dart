import 'package:flutter/material.dart';
import 'package:flutter_boot_challenge/day_1/day_1_advanced_app.dart';
import 'package:flutter_boot_challenge/day_2/day_2_basic_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Day2BasicApp(),
    );
  }
}
