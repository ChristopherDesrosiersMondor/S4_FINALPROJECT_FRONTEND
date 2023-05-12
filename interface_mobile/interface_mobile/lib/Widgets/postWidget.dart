import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

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
          const Icon(Icons.account_circle),
          Text(communityName),
          Text(postDate)
        ],
      ),
      Text(postTitle),
      Text(postContent),
      Image(image: NetworkImage(postSource)),
      Row(
        children: [
          const Icon(Icons.arrow_upward_rounded),
          Text(postUpVote.toString()),
          const Icon(Icons.arrow_downward_rounded),
          Text(postDownVote.toString()),
          const Icon(Icons.comment),
          const Icon(Icons.share),
          const Text("Share")
        ],
      )
    ]);
  }
}
