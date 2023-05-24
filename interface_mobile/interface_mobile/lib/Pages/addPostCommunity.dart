import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interface_mobile/Entities/community.dart';
import 'package:interface_mobile/Widgets/communityWidget.dart';
import 'package:interface_mobile/Widgets/dropdownMenu.dart';
import 'package:interface_mobile/utilities.dart';
import '../config.dart';

class AddCommunityToPost extends StatelessWidget {
  const AddCommunityToPost(
      {super.key, required this.title, required this.body});

  final String title;
  final String body;

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
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: communities.length,
            itemBuilder: (context, index) {
              return CommunityWidget(
                  communityId: communities[index].id,
                  communityName: communities[index].communityName);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
