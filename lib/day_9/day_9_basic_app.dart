import 'dart:math';

import 'package:flutter/material.dart';

class Day9BasicApp extends StatefulWidget {
  const Day9BasicApp({super.key});

  @override
  State<Day9BasicApp> createState() => _Day9BasicAppState();
}

class _Day9BasicAppState extends State<Day9BasicApp> {
  List<int> imageIds = List.generate(10, (index) => Random().nextInt(1000) + 1);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Click left and right'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (currentIndex > 0) {
                    currentIndex--;
                    setState(() {});
                  }
                },
                child: const Icon(Icons.arrow_left),
              ),
              ElevatedButton(
                onPressed: () {
                  if (currentIndex == imageIds.length - 1) {
                    imageIds.add(Random().nextInt(1000) + 1);
                  }
                  currentIndex++;
                  setState(() {});
                },
                child: const Icon(Icons.arrow_right),
              ),
            ],
          ),
          Expanded(
            child: Image.network(
              getRandomImageSrc(imageIds[currentIndex]),
              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                if (frame == null) {
                  return const Center(child: Text('Loading...'));
                }
                return child;
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text('Error loading image'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String getRandomImageSrc(int id) {
    return 'https://picsum.photos/id/$id/200/200';
  }
}
