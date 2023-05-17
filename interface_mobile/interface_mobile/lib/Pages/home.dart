import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/connexion.dart';
import 'package:interface_mobile/Widgets/dropdownMenu.dart';
import 'package:interface_mobile/Widgets/postWidget.dart';
import 'package:interface_mobile/utilities.dart';

import '../Entities/post.dart';
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
              return ListView(
                children: posts
                    .map(
                      (Post post) => ListTile(
                        title: Text(post.postTitle),
                        subtitle: Text(post.postContent),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
