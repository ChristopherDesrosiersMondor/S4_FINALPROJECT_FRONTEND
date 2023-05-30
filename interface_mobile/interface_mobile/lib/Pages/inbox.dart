import 'package:flutter/material.dart';
import '../config.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({Key? keyInbox}) : super(key: keyInbox);

  @override
  State<StatefulWidget> createState() => _InboxState();
}

class _InboxState extends State<InboxPage> {
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
