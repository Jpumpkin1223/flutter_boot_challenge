import 'dart:async';

import 'package:flutter/material.dart';

class Day2BasicApp extends StatefulWidget {
  const Day2BasicApp({super.key});

  @override
  State<Day2BasicApp> createState() => _Day2BasicAppState();
}

class _Day2BasicAppState extends State<Day2BasicApp> {
  double gaugePercent = 0.0;
  int score = 0;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      setState(() {
        gaugePercent -= 0.05;
        if (gaugePercent < 0) {
          gaugePercent = 0.0;
          score = 0;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Your Score',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$score',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: 30,
                height: height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Container(
                width: 30,
                height: gaugePercent * height * 0.5,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: () => fillGauge(),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void fillGauge() {
    setState(() {
      gaugePercent += 0.25;
      if (gaugePercent > 1) {
        gaugePercent = 1.0;
        score += 1;
      }
    });
  }
}
