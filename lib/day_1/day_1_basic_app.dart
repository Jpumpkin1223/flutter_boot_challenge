import 'package:flutter/material.dart';

class Day1BasicApp extends StatefulWidget {
  const Day1BasicApp({super.key});

  @override
  State<Day1BasicApp> createState() => _Day1BasicAppState();
}

class _Day1BasicAppState extends State<Day1BasicApp> {
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 200 || constraints.maxHeight < 300) {
          return const Scaffold(
            body: Center(
              child: Text('Screen too small'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: const Text('FlutterBoot Plus', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 32)),
              centerTitle: false,
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Scrollbar(
                        controller: _scrollController,
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          child: Column(
                            children: [
                              itemBox(
                                Icons.bolt,
                                'Premium features',
                                'Plus subscribers have access to FlutterBoot+ and out lastest beta features',
                              ),
                              itemBox(
                                Icons.whatshot,
                                'Priority access',
                                'You\'ll be able to use FlutterBoot+ even when demand is high',
                              ),
                              itemBox(
                                Icons.speed,
                                'Ultra-fast',
                                'Enjoy even faster response speeds when using FlutterBoot',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Text('Restore subscription', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 14)),
                        const SizedBox(height: 16),
                        Text(
                          'Auto-renews for \$25/month until cancelled',
                          style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            minimumSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
                          ),
                          child: const Text(
                            'Subscribe',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget itemBox(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0), child: Icon(icon, size: 32)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 18),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//Premium features
//Plus subscribers have access to FlutterBoot+ and out lastest beta features

//Priority access
//You'll be able to use FlutterBoot+ even when demand is high

//Ultra-fast
//Enjoy even faster response speeds when using FlutterBoot

//Restore subscription
//Auto-renews for $25/month until cancelled

//Subscribe