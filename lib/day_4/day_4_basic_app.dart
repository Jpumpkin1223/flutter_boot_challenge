import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Day4BasicApp extends StatefulWidget {
  const Day4BasicApp({super.key});

  @override
  State<Day4BasicApp> createState() => _Day4BasicAppState();
}

class _Day4BasicAppState extends State<Day4BasicApp> {
  late FocusNode focusNode1, focusNode2;
  late TextEditingController controller1, controller2;

  @override
  void initState() {
    focusNode1 = FocusNode(
      onKey: (node, event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.backspace) {
            if (controller1.text.isEmpty) {
              FocusScope.of(context).requestFocus(focusNode2);
              return KeyEventResult.handled;
            }
          }
        }
        return KeyEventResult.skipRemainingHandlers;
      },
    );
    focusNode2 = FocusNode(
      onKey: (node, event) {
        if (event is RawKeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.backspace) {
            if (controller2.text.isEmpty) {
              FocusScope.of(context).requestFocus(focusNode1);
              return KeyEventResult.handled;
            }
          }
        }
        return KeyEventResult.skipRemainingHandlers;
      },
    );

    controller1 = TextEditingController()..text = 'Hello';
    controller2 = TextEditingController()..text = 'FlutterBoot!';

    super.initState();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello TextField')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  focusNode: focusNode1,
                  controller: controller1,
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(focusNode2);
                  },
                ),
              ),
              const SizedBox(width: 16.0),
              Flexible(
                child: TextField(
                  focusNode: focusNode2,
                  controller: controller2,
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(focusNode1);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
