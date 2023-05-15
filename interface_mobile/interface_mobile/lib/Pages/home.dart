import 'package:flutter/material.dart';
import 'package:interface_mobile/Widgets/dropdownMenu.dart';
import 'package:interface_mobile/Widgets/postWidget.dart';

import '../config.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {}),
        title: const DropdownMenuApp(),
        actions: const <Widget>[Icon(Icons.search), Icon(Icons.account_circle)],
        backgroundColor: Configuration.appDarkBackgroundColor,
      ),
      backgroundColor: Configuration.appDarkBackgroundColor,
      body: const PostWidget(
          postId: 1,
          postTitle: "Post Title",
          postContent: "postContent",
          postSource:
              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
          postDate: "2023/05/12",
          postUpVote: 5,
          postDownVote: 1,
          username: "username",
          communityName: "communityName"),
    );
  }
}