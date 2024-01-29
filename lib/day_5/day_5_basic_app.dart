import 'package:flutter/material.dart';

class Day5BasicApp extends StatefulWidget {
  const Day5BasicApp({super.key});

  @override
  State<Day5BasicApp> createState() => _Day5BasicAppState();
}

class _Day5BasicAppState extends State<Day5BasicApp> {
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My First ListView!'),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          controller: _scrollController,
          itemCount: spaceData.length,
          itemBuilder: (BuildContext context, int index) {
            String key = spaceData.keys.elementAt(index);
            String value = spaceData[key].toString();
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ClipRect(
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  title: Text('$key was discovered in $value'),
                  leading: const Text(
                    '🛰️',
                    style: TextStyle(fontSize: 30),
                  ),
                  onTap: null,
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.navigation),
          onPressed: () {
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
            );
          },
        ));
  }
}

final spaceData = {
  'NGC 162': 1862,
  '87 Sylvia': 1866,
  'R 136a1': 1985,
  '28978 Ixion': 2001,
  'NGC 6715': 1778,
  '94400 Hongdaeyong': 2001,
  '6354 Vangelis': 1934,
  'C/2020 F3': 2020,
  'Cartwheel Galaxy': 1941,
  'Sculptor Dwarf Elliptical Galaxy': 1937,
  'Eight-Burst Nebula': 1835,
  'Rhea': 1672,
  'C/1702 H1': 1702,
  'Messier 5': 1702,
  'Messier 50': 1711,
  'Cassiopeia A': 1680,
  'Great Comet of 1680': 1680,
  'Butterfly Cluster': 1654,
  'Triangulum Galaxy': 1654,
  'Comet of 1729': 1729,
  'Omega Nebula': 1745,
  'Eagle Nebula': 1745,
  'Small Sagittarius Star Cloud': 1764,
  'Dumbbell Nebula': 1764,
  '54509 YORP': 2000,
  'Dia': 2000,
  '63145 Choemuseon': 2000,
};
