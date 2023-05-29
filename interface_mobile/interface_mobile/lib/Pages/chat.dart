import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/Connexion.dart';

import '../config.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? keyChat, this.userConnectId, required this.connectUser})
      : super(key: keyChat);

  final int? userConnectId;
  final void Function(int id) connectUser;

  @override
  Widget build(BuildContext context) {
    if (userConnectId != null) {
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
                          builder: (context) => const ConnexionPage()),
                    );
                  },
                  child:
                      const Text("Connect to have access to all our features"),
                ),
              )));
    }
  }
}
