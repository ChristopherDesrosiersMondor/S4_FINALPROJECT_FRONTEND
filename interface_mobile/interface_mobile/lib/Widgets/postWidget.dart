import 'dart:ffi';
import 'package:flutter/material.dart';

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
      required this.postIdUser,
      required this.postIdCom});

  final Long postId;
  final String postTitle;
  final String postContent;
  final String postSource;
  final DateTime postDate;
  final int postUpVote;
  final int postDownVote;
  final Long postIdUser;
  final int postIdCom;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          children: [],
        ),
        const Image(image: NetworkImage(postSource))
      ]),
    );
  }
}
