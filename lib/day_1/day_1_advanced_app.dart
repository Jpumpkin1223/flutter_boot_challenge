// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Day1AdvancedApp extends StatefulWidget {
  const Day1AdvancedApp({super.key});

  @override
  State<Day1AdvancedApp> createState() => _Day1AdvancedAppState();
}

class _Day1AdvancedAppState extends State<Day1AdvancedApp> {
  List<ChatItemBox> chatList = [
    const ChatItemBox(isBot: true, chatText: 'Hello, how can I help you?'),
  ];

  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void addChat() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        chatList.add(ChatItemBox(isBot: false, chatText: _textController.text));
        _textController.clear();
        chatList.add(const ChatItemBox(isBot: true, chatText: 'Actually, I don\'t have any feature, but one day I\'ll grow up and become ChatGPT!'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    return chatList[index];
                  },
                ),
              ),
              BottomTextField(textController: _textController, onSubmitted: addChat),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      leading: const Icon(Icons.menu, color: Colors.black, size: 32),
      title: const Row(
        children: [
          Text('MyCuteGPT', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 32)),
          SizedBox(width: 12),
          Text('3.5', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 32)),
        ],
      ),
      titleSpacing: 8,
      centerTitle: false,
      actions: const [
        Icon(Icons.edit, color: Colors.black, size: 32),
        SizedBox(width: 12),
        Icon(Icons.more_vert, color: Colors.black, size: 32),
      ],
    );
  }
}

class ChatItemBox extends StatelessWidget {
  const ChatItemBox({super.key, required this.isBot, required this.chatText});
  final bool isBot;
  final String chatText;

  @override
  Widget build(BuildContext context) {
    String avatarText = isBot ? 'G' : 'FC';
    Color avatarColor = isBot ? Colors.green : Colors.deepPurple;
    String name = isBot ? 'MyCuteGPT' : 'FlutterBoot';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title(avatarText, avatarColor, name),
          Padding(
            padding: const EdgeInsets.only(left: 36),
            child: Text(
              chatText,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget title(String avatarText, Color avatarColor, String name) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: CircleAvatar(
            radius: 12,
            backgroundColor: avatarColor,
            child: Text(avatarText, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12)),
          ),
        ),
        Text(name, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 12)),
      ],
    );
  }
}

class BottomTextField extends StatefulWidget {
  const BottomTextField({super.key, required this.textController, required this.onSubmitted});
  final TextEditingController textController;
  final void Function() onSubmitted;

  @override
  State<BottomTextField> createState() => _BottomTextFieldState();
}

class _BottomTextFieldState extends State<BottomTextField> {
  bool isTextEmpty = true;
  @override
  void initState() {
    widget.textController.addListener(() {
      isTextEmpty = widget.textController.text.isEmpty;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: widget.textController,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Message',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(24),
                ),
                filled: true,
                fillColor: Colors.grey,
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                suffixIcon: isTextEmpty ? const Icon(Icons.graphic_eq, color: Colors.black) : null,
              ),
            ),
          ),
          const SizedBox(width: 16),
          CustomIconButton(isActivated: !isTextEmpty, onPressed: widget.onSubmitted),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.isActivated,
    required this.onPressed,
  }) : super(key: key);
  final bool isActivated;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isActivated ? Colors.black : Colors.grey;
    Color iconColor = isActivated ? Colors.white : Colors.white;
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.arrow_upward, color: iconColor),
        ),
      ),
    );
  }
}
