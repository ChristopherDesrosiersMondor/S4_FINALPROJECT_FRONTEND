import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:interface_mobile/Pages/addPostCommunity.dart';
import 'package:interface_mobile/Pages/home.dart';
import 'package:interface_mobile/main.dart';

import '../config.dart';

class AddPostPage extends StatelessWidget {
  final GlobalKey<AddPostFormState> _key = GlobalKey();

  AddPostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Configuration.appDarkBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HublotWidget()),
              );
            }),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 51, 50, 50),
                  minimumSize: const Size(80, 20),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
                onPressed: () => _key.currentState!.validateForm(),
                child: Text(
                  'Next',
                  style: Configuration.textForApp(Colors.white60, 14),
                ),
              ))
        ],
        backgroundColor: Configuration.appDarkBackgroundColor,
      ),
      body: SingleChildScrollView(
          child: AddPostForm(
        key: _key,
      )),
    );
  }
}

class AddPostForm extends StatefulWidget {
  const AddPostForm({Key? key}) : super(key: key);

  @override
  State<AddPostForm> createState() => AddPostFormState();
}

class AddPostFormState extends State<AddPostForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: titleController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration.collapsed(
                  hintStyle: Configuration.textForApp(Colors.white60, 22),
                  hintText: "Title",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: contentController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Colors.white60),
                  hintText: "body (optional)",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            )
          ],
        ));
  }

  validateForm() {
    if (_formKey.currentState!.validate()) {}
  }
}
