import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/Connexion.dart';

import '../config.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? keyChat, this.userConnectId, this.connectUserOnApp})
      : super(key: keyChat);

  int? userConnectId;
  final void Function(int id)? connectUserOnApp;

  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.userConnectId != null) {
      return Scaffold(
          backgroundColor: Configuration.appDarkBackgroundColor,
          body: Center(
            child: Text(
              "Page en construction",
              style: Configuration.textForApp(Colors.white, 18),
            ),
          ));
    } else {
      return Scaffold(
          backgroundColor: Configuration.appDarkBackgroundColor,
          body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: ElevatedButton(
                  style: Configuration.formButtonStyle(context),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConnexionPage(
                                connectUserOnApp: widget.connectUserOnApp,
                              )),
                    );
                  },
                  child:
                      const Text("Connect to have access to all our features"),
                ),
              )));
    }
  }
}
