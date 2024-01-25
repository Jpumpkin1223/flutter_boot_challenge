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
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
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
                  child: CustomTextField(
                selfFocusNode: focusNode1,
                beforeFocusNode: focusNode2,
                nextFocusNode: focusNode2,
                controller: controller1,
              )),
              const SizedBox(width: 16.0),
              Flexible(
                  child: CustomTextField(
                selfFocusNode: focusNode2,
                beforeFocusNode: focusNode1,
                nextFocusNode: focusNode1,
                controller: controller2,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.selfFocusNode, required this.beforeFocusNode, required this.nextFocusNode, required this.controller});
  final FocusNode selfFocusNode;
  final FocusNode beforeFocusNode;
  final FocusNode nextFocusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      child: TextField(
        focusNode: selfFocusNode,
        controller: controller,
        onSubmitted: (value) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
      ),
      onKey: (keyEvent) {
        if (keyEvent is RawKeyDownEvent) {
          if (keyEvent.logicalKey == LogicalKeyboardKey.backspace && controller.text.isEmpty) {
            FocusScope.of(context).requestFocus(beforeFocusNode);
          }
        }
      },
    );
  }
}
