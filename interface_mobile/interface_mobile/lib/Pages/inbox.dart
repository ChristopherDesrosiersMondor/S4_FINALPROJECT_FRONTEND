import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/Connexion.dart';

import '../config.dart';

class InboxPage extends StatefulWidget {
  InboxPage({Key? keyInbox, this.userConnectId, required this.connectUserOnApp})
      : super(key: keyInbox);

  int? userConnectId;
  final void Function(int id) connectUserOnApp;

  @override
  State<StatefulWidget> createState() => _InboxState();
}

class _InboxState extends State<InboxPage> {
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
