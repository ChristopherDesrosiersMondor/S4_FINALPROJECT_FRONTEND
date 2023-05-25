import 'package:flutter/material.dart';
import 'package:interface_mobile/config.dart';
import 'package:interface_mobile/utilities.dart';

class PostWidget extends StatefulWidget {
  PostWidget(
      {Key? keyPostWidget,
      required this.postId,
      required this.postTitle,
      required this.postContent,
      required this.postSource,
      required this.postDate,
      required this.postUpVote,
      required this.postDownVote,
      required this.username,
      required this.communityName,
      required this.postUserId,
      required this.postCommId})
      : super(key: keyPostWidget);

  final int postId;
  final String postTitle;
  final String postContent;
  final String postSource;
  final String postDate;
  int postUpVote;
  int postDownVote;
  final int postUserId;
  final int postCommId;
  final String username;
  final String communityName;

  @override
  State<PostWidget> createState() => PostWidgetState();
}

class PostWidgetState extends State<PostWidget> {
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
              widget.username,
              style:
                  Configuration.mainContentTextForApp(Colors.grey.shade400, 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Text(
              widget.postDate,
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
              widget.postTitle,
              style: Configuration.textForApp(Colors.white, 16),
            ),
          )),
      Container(
        padding: const EdgeInsets.only(bottom: 5),
        child: widget.postContent != ""
            ? Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.postContent,
                  style: Configuration.mainContentTextForApp(Colors.white, 16),
                ),
              )
            : null,
      ),
      Container(
          child: widget.postSource != ""
              ? Image(image: NetworkImage(widget.postSource))
              : null),
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
                onPressed: () {
                  updatePost(
                      widget.postId,
                      widget.postTitle,
                      widget.postContent,
                      widget.postSource,
                      widget.postDate,
                      widget.postUpVote + 1,
                      widget.postDownVote,
                      widget.postUserId,
                      widget.postCommId);
                  setState(() {
                    widget.postUpVote += 1;
                  });
                },
              ),
              Text(
                widget.postUpVote.toString(),
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
                onPressed: () {
                  updatePost(
                      widget.postId,
                      widget.postTitle,
                      widget.postContent,
                      widget.postSource,
                      widget.postDate,
                      widget.postUpVote,
                      widget.postDownVote + 1,
                      widget.postUserId,
                      widget.postCommId);
                  setState(() {
                    widget.postDownVote += 1;
                  });
                },
              ),
              Text(
                widget.postDownVote.toString(),
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
