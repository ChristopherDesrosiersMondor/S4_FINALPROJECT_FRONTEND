import 'dart:ffi';
import 'package:flutter/material.dart';
import '../config.dart';

class CommunityWidget extends StatelessWidget {
  const CommunityWidget(
      {super.key,
      required this.communityId,
      required this.communityName,
      required this.title,
      required this.body});

  final int communityId;
  final String communityName;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(children: [
            const Icon(
              Icons.anchor,
              color: Colors.white,
            ),
            Column(
              children: [
                Text(
                  communityName,
                  style: Configuration.textForApp(Colors.white, 16),
                ),
                Text(
                  "1K Online - Subscribed",
                  style:
                      Configuration.mainContentTextForApp(Colors.white60, 14),
                )
              ],
            )
          ]),
        ));
  }
}
