import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/Connexion.dart';
import 'package:interface_mobile/Widgets/dropdownMenu.dart';
import 'package:interface_mobile/Widgets/postWidget.dart';
import 'package:interface_mobile/utilities.dart';

import '../Entities/post.dart';
import '../config.dart';

const List<String> list = <String>['Home', 'Popular', 'News', 'New on Hublot!'];

class Home extends StatefulWidget {
  const Home({Key? keyHome, this.userConnectId, required this.connectUser})
      : super(key: keyHome);

  final int? userConnectId;
  final VoidCallback connectUser;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Post>> posts;
  dynamic username;

  @override
  void initState() {
    super.initState();
    posts = getAllPost();
    if (widget.userConnectId != null) {
      username = getUsernameById(widget.userConnectId);
    }
  }

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
            child: DropdownMenuApp(list: list),
          ),
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            (widget.userConnectId != null)
                ? Padding(
                    padding: EdgeInsets.all(5), child: Text("Hi $username"))
                : Padding(padding: EdgeInsets.all(5), child: Text("Hi!")),
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
          future: getAllPost(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PostWidget(
                        refreshPage: refresh,
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

  refresh() {
    setState(() {
      posts = getAllPost();
    });
  }
}
