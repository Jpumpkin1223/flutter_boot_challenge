import 'package:flutter/material.dart';

class Day1BasicApp extends StatelessWidget {
  const Day1BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
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
              Column(
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w600, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
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