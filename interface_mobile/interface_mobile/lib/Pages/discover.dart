import 'package:flutter/material.dart';

import '../config.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({Key? keyDiscover}) : super(key: keyDiscover);

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
