import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/AddPost.dart';
import '../config.dart';

class CommunityWidget extends StatelessWidget {
  const CommunityWidget(
      {super.key,
      required this.communityId,
      required this.communityName,
      required this.title,
      required this.body,
      required this.image});

  final int communityId;
  final String communityName;
  final String title;
  final String body;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddPostPage(
                      communityId: communityId,
                      communityName: communityName,
                      title: title,
                      body: body,
                      image: image,
                    )),
          );
        },
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
