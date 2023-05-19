import 'package:flutter/material.dart';
import 'package:interface_mobile/config.dart';
import 'dart:ffi';

class PostWidget extends StatelessWidget {
  const PostWidget(
      {super.key,
      required this.postId,
      required this.postTitle,
      required this.postContent,
      required this.postSource,
      required this.postDate,
      required this.postUpVote,
      required this.postDownVote,
      required this.username,
      required this.communityName});

  final int postId;
  final String postTitle;
  final String postContent;
  final String postSource;
  final String postDate;
  final int postUpVote;
  final int postDownVote;
  final String username;
  final String communityName;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          const Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Text(
              username,
              style:
                  Configuration.mainContentTextForApp(Colors.grey.shade400, 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Text(
              postDate,
              style: Configuration.secondContentTextForApp(
                  Colors.grey.shade400, 12),
            ),
          )
        ],
      ),
      Container(
          padding: const EdgeInsets.only(top: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              postTitle,
              style: Configuration.textForApp(Colors.white, 16),
            ),
          )),
      Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              postContent,
              style: Configuration.mainContentTextForApp(Colors.white, 16),
            ),
          )),
      Image(image: NetworkImage(postSource)),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 5, 5),
            child:
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_upward_rounded,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {},
              ),
              Text(
                postUpVote.toString(),
                style: Configuration.mainContentTextForApp(
                    Colors.grey.shade500, 14),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 10, 5),
            child:
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_downward_rounded,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {},
              ),
              Text(
                postDownVote.toString(),
                style: Configuration.mainContentTextForApp(
                    Colors.grey.shade500, 14),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child: IconButton(
              icon: Icon(
                Icons.comment,
                color: Colors.grey.shade500,
              ),
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
            child:
                Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.grey.shade500,
                ),
                onPressed: () {},
              ),
              Text(
                "Share",
                style: Configuration.mainContentTextForApp(
                    Colors.grey.shade500, 14),
              )
            ]),
          ),
        ],
      )
    ]);
  }
}
