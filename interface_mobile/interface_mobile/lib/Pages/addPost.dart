import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/addPostCommunity.dart';
import 'package:interface_mobile/main.dart';
import 'package:interface_mobile/utilities.dart';
import '../config.dart';

// Sources:
// How to call a child method
// https://stackoverflow.com/questions/48481590/how-to-set-update-state-of-statefulwidget-from-other-statefulwidget-in-flutter

class AddPostPage extends StatelessWidget {
  final GlobalKey<AddPostFormState> _keyAddPostPage =
      GlobalKey<AddPostFormState>();

  final int? communityId;
  final String? communityName;
  final String? title;
  final String? body;
  final String? image;

  AddPostPage(
      {Key? keyAddPost,
      this.communityId,
      this.communityName,
      this.title,
      this.body,
      this.image})
      : super(key: keyAddPost);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Configuration.appDarkBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              _keyAddPostPage.currentState!.emptyInput();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HublotWidget()),
              );
            }),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.all(10),
              // Final publish page -> community has been selected
              child: (communityId != null && communityName != null)
                  ? TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 51, 50, 50),
                        minimumSize: const Size(80, 20),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () {
                        _keyAddPostPage.currentState!.validateAndPublish();
                      },
                      child: Text(
                        'Publish',
                        style: Configuration.textForApp(Colors.white60, 14),
                      ),
                    )
                  // First make post page -> community has NOT been selected
                  : TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 51, 50, 50),
                        minimumSize: const Size(80, 20),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      ),
                      onPressed: () =>
                          _keyAddPostPage.currentState!.validateForm(),
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
        keyPostForm: _keyAddPostPage,
        getCommId: getCommunityId,
        getCommName: getCommunityName,
        getTitle: getTitle,
        getBody: getBody,
        getImage: getImage,
      )),
    );
  }

  getCommunityId() {
    if (communityId != null) {
      return communityId;
    }
    return null;
  }

  getCommunityName() {
    if (communityName != null) {
      return communityName;
    }
    return null;
  }

  getTitle() {
    if (title != null) {
      return title;
    }
    return "";
  }

  getBody() {
    if (body != null) {
      return body;
    }
    return "";
  }

  getImage() {
    if (image != null) {
      return image;
    }
    return "";
  }
}

class AddPostForm extends StatefulWidget {
  const AddPostForm(
      {Key? keyPostForm,
      required this.getCommId,
      required this.getCommName,
      required this.getTitle,
      required this.getBody,
      required this.getImage})
      : super(key: keyPostForm);
  final ValueGetter getCommId;
  final ValueGetter getCommName;
  final ValueGetter getTitle;
  final ValueGetter getBody;
  final ValueGetter getImage;

  @override
  State<AddPostForm> createState() => AddPostFormState();
}

class AddPostFormState extends State<AddPostForm> {
  final GlobalKey<FormState> _formKeyAddPost = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKeyAddPost,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10),
                // Final publish page -> community has been selected`
                child: (widget.getCommId() != null &&
                        widget.getCommName() != null)
                    ? Row(
                        children: [
                          const Icon(
                            Icons.anchor,
                            color: Colors.white,
                          ),
                          Text(
                            widget.getCommName(),
                            style: Configuration.textForApp(Colors.white, 16),
                          ),
                        ],
                      )
                    : // First make post page -> community has NOT been selected
                    null),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: titleController..text = widget.getTitle(),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration.collapsed(
                  hintStyle: Configuration.textForApp(Colors.white60, 22),
                  hintText: "Title",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a text';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: contentController..text = widget.getBody(),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Colors.white60),
                  hintText: "body (optional)",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: imageController..text = widget.getImage(),
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration.collapsed(
                  hintStyle: TextStyle(color: Colors.white60),
                  hintText: "Lien vers l'image",
                ),
              ),
            ),
          ],
        ));
  }

  validateForm() {
    if (_formKeyAddPost.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AddCommunityToPost(
                  title: titleController.text,
                  body: contentController.text,
                  image: imageController.text,
                )),
      );
    }
  }

  emptyInput() {
    titleController.clear();
    contentController.clear();
  }

  validateAndPublish() {
    if (_formKeyAddPost.currentState!.validate()) {
      createPost(titleController.text, contentController.text,
          imageController.text, 1, widget.getCommId());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
    }
  }
}
