import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/Connexion.dart';
import 'package:interface_mobile/Widgets/dropdownMenu.dart';
import 'package:interface_mobile/Widgets/postWidget.dart';
import 'package:interface_mobile/main.dart';
import 'package:interface_mobile/utilities.dart';
import 'package:provider/provider.dart';

import '../Entities/post.dart';
import '../config.dart';

const List<String> list = <String>['Home', 'Popular', 'News', 'New on Hublot!'];

class Home extends StatefulWidget {
  const Home({
    Key? keyHome,
    this.connectUserOnApp,
  }) : super(key: keyHome);

  final void Function(int id)? connectUserOnApp;

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<Post>> posts;
  dynamic username;
  dynamic userConnectId;

  @override
  void initState() {
    super.initState();
    posts = getAllPost();
  }

  void updateUserConnectId(int id) {
    getUsernameById(id).then((value) {
      username = value;
    });
    setState(() {
      userConnectId = id;
      username = username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectUser>(
        builder: (context, value, child) => Scaffold(
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
                (value.userId != null)
                    ? Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text("Hi" + value.username))
                    : const Padding(
                        padding: EdgeInsets.all(5), child: Text("Hi!")),
                IconButton(
                  icon: const Icon(Icons.account_circle),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConnexionPage(
                                connectUserOnApp: widget.connectUserOnApp,
                              )),
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
            )));
  }

  refresh() {
    setState(() {
      posts = getAllPost();
    });
  }
}
