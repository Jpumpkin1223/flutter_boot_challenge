import 'dart:math';

import 'package:flutter/material.dart';

class Day6BasicApp extends StatefulWidget {
  const Day6BasicApp({super.key});

  @override
  State<Day6BasicApp> createState() => _Day6BasicAppState();
}

class _Day6BasicAppState extends State<Day6BasicApp> {
  int point = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Point: $point',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  int? newScore = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const PointDialog();
                      });
                  if (newScore != null) {
                    setState(() {
                      point = newScore;
                    });
                  }
                },
                child: const Text('I want more points!'))
          ],
        ),
      ),
    );
  }
}

class PointDialog extends StatefulWidget {
  const PointDialog({super.key});

  @override
  State<PointDialog> createState() => _PointDialogState();
}

class _PointDialogState extends State<PointDialog> {
  Future<List<int>> getPointList() async {
    final pointSet = <int>{};
    late List<int> pointList;
    while (pointSet.length < 3) {
      pointSet.add(Random().nextInt(100));
    }
    pointList = pointSet.toList()..sort((a, b) => a.compareTo(b));
    return pointList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPointList(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<int> pointList = snapshot.data;
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: 400,
                height: 120,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose your next point!',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '''Choose one of the points below!\nIf you don't make a selection, your current score will be retained.''',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: pointList
                            .map((e) => TextButton(
                                  onPressed: () => Navigator.pop(context, e),
                                  child: Text(e.toString()),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
