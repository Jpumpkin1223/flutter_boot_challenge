import 'package:flutter/material.dart';

class Day3BasicApp extends StatefulWidget {
  const Day3BasicApp({super.key});

  @override
  State<Day3BasicApp> createState() => _Day3BasicAppState();
}

class _Day3BasicAppState extends State<Day3BasicApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('I can layout this'),
        backgroundColor: Colors.red,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double bodyWidth = constraints.maxWidth;
          double bodyHeight = constraints.maxHeight;
          if (bodyWidth > bodyHeight) {
            // return SingleChildScrollView(
            //   physics: const NeverScrollableScrollPhysics(),
            //   child: BoxA(boxWidth: bodyWidth, boxHeight: bodyWidth),
            // );
            return OverflowBox(
              maxHeight: double.infinity,
              alignment: Alignment.topCenter,
              child: BoxA(boxWidth: bodyWidth, boxHeight: bodyWidth),
            );
          } else {
            return Column(
              children: [
                BoxA(boxWidth: bodyWidth, boxHeight: bodyWidth),
                const Expanded(child: BoxB()),
              ],
            );
          }
        },
      ),
    );
  }
}

class BoxA extends StatelessWidget {
  const BoxA({super.key, required this.boxWidth, required this.boxHeight});

  final double boxWidth;
  final double boxHeight;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      height: boxHeight,
      child: const Column(
        children: [
          Flexible(
            child: Row(
              children: [
                Flexible(child: BoxAA()),
                VerticalDivider(color: Colors.black, thickness: 8, width: 8),
                Flexible(child: BoxAB()),
              ],
            ),
          ),
          Divider(color: Colors.black, thickness: 8, height: 8),
          Flexible(
            child: Row(
              children: [
                Flexible(child: BoxAC()),
                VerticalDivider(color: Colors.black, thickness: 8, width: 8),
                Flexible(child: BoxAD()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoxAA extends StatelessWidget {
  const BoxAA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.grey);
  }
}

class BoxAB extends StatelessWidget {
  const BoxAB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: Container(color: Colors.blue)),
        Flexible(child: Container()),
      ],
    );
  }
}

class BoxAC extends StatelessWidget {
  const BoxAC({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(flex: 2, child: Container()),
        Flexible(flex: 1, child: Container(color: Colors.green)),
      ],
    );
  }
}

class BoxAD extends StatelessWidget {
  const BoxAD({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Flexible(flex: 1, child: Container(color: Colors.yellow)),
          Flexible(flex: 1, child: Container()),
        ],
      ),
    );
  }
}

class BoxB extends StatelessWidget {
  const BoxB({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(flex: 2, child: Container(color: Colors.yellow)),
        Flexible(flex: 1, child: Container(color: Colors.brown)),
      ],
    );
  }
}
