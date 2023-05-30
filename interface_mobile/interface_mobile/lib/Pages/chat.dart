import 'package:flutter/material.dart';
import '../config.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? keyInbox}) : super(key: keyInbox);

  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Configuration.appDarkBackgroundColor,
        body: Center(
          child: Text(
            "Page en construction",
            style: Configuration.textForApp(Colors.white, 18),
          ),
        ));
  }
}
