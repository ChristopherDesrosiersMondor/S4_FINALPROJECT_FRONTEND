import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interface_mobile/Entities/community.dart';
import 'package:interface_mobile/Widgets/communityWidget.dart';
import 'package:interface_mobile/Widgets/dropdownMenu.dart';
import 'package:interface_mobile/utilities.dart';
import '../config.dart';

class AddCommunityToPost extends StatelessWidget {
  const AddCommunityToPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Configuration.appDarkBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Configuration.appDarkBackgroundColor,
      ),
      body: const AddCommunityToPostForm(),
    );
  }
}

class AddCommunityToPostForm extends StatefulWidget {
  const AddCommunityToPostForm({super.key});

  @override
  State<AddCommunityToPostForm> createState() => AddCommunityToPostFormState();
}

class AddCommunityToPostFormState extends State<AddCommunityToPostForm> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAllCommunities(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<Community> communities = snapshot.data;
          return ListView(
            children: communities
                .map(
                  (Community community) => ListTile(
                    title: Text(community.communityName),
                    subtitle: Text("${community.id}"),
                  ),
                )
                .toList(),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
    // return SafeArea(
    //   child: Scaffold(
    //     body: Container(
    //       padding: EdgeInsets.all(16.0),
    //       child: FutureBuilder(
    //         future: getAllCommunities(),
    //         builder: (BuildContext ctx, AsyncSnapshot snapshot) {
    //           if (snapshot.data == null) {
    //             return Container(
    //               child: Center(
    //                 child: CircularProgressIndicator(),
    //               ),
    //             );
    //           } else {
    //             return ListView.builder(
    //               itemCount: snapshot.data.length,
    //               itemBuilder: (ctx, index) => ListTile(
    //                 title: Text(snapshot.data[index].communityName),
    //                 subtitle: Text(snapshot.data[index].id),
    //                 contentPadding: EdgeInsets.only(bottom: 20.0),
    //               ),
    //             );
    //           }
    //         },
    //       ),
    //     ),
    //   ),
    // );
    // return Container(
    //   padding: const EdgeInsets.all(10),
    //   child: FutureBuilder(
    //     future: getAllCommunities(),
    //     builder: (BuildContext ctx, AsyncSnapshot snapshot) {
    //       if (snapshot.data == null) {
    //         return const Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       } else {
    //         return ListView.builder(
    //           itemCount: snapshot.data.length,
    //           itemBuilder: (ctx, index) => CommunityWidget(
    //             communityId: snapshot.data[index].id,
    //             communityName: snapshot.data[index].communityName,
    //           ),
    //         );
    //       }
    //     },
    //   ),
    // );
    // return Configuration.communityChoices("communityName");
  }
}
