import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../config.dart';
import 'addPost.dart';

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
      body: const SingleChildScrollView(child: AddCommunityToPostForm()),
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
    return Configuration.communityChoices("communityName");
  }
}
