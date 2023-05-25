import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/Connexion.dart';
import 'package:interface_mobile/Widgets/dropdownMenu.dart';
import 'package:interface_mobile/Widgets/postWidget.dart';
import 'package:interface_mobile/utilities.dart';

import '../Entities/post.dart';
import '../config.dart';

class Home extends StatelessWidget {
  const Home({Key? keyHome}) : super(key: keyHome);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {}),
          title: const Align(
            alignment: Alignment.topLeft,
            child: DropdownMenuApp(),
          ),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            IconButton(
              icon: const Icon(Icons.account_circle),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ConnexionPage()),
                );
              },
            )
          ],
          backgroundColor: Configuration.appDarkBackgroundColor,
        ),
        backgroundColor: Configuration.appDarkBackgroundColor,
        body: FutureBuilder(
          future: getAllPost(context),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PostWidget(
                        postId: posts[index].id,
                        postTitle: posts[index].postTitle,
                        postContent: posts[index].postContent,
                        postSource: posts[index].postSource,
                        postDate: posts[index].postDate.toString(),
                        postUpVote: posts[index].postUpVote,
                        postDownVote: posts[index].postDownVote,
                        postUserId: posts[index].postIdUser,
                        postCommId: posts[index].postIdCom,
                        username: posts[index].username,
                        communityName: posts[index].postIdCom.toString());
                  });
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
