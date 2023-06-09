import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:flutter/material.dart' hide Key;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:interface_mobile/Entities/account.dart';
import 'package:interface_mobile/Entities/community.dart';
import 'package:interface_mobile/Widgets/postWidget.dart';
import 'package:intl/intl.dart';

import 'Entities/post.dart';

// Sources:

// Http request with flutter
// https://docs.flutter.dev/cookbook/networking/send-data
// https://docs.flutter.dev/cookbook/networking/fetch-data
// https://www.geeksforgeeks.org/http-get-response-in-flutter/
// https://www.digitalocean.com/community/tutorials/flutter-flutter-http
// https://docs.flutter.dev/cookbook/networking/delete-data

// Hash text
// https://medium.flutterdevs.com/explore-encrypt-decrypt-data-in-flutter-576425347439

bool iOS = false;

// connecter un utilisateur
Future<Account> userConnect(
    BuildContext context, String pseudo, String password) async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8082/accounts/view/by_pseudo/$pseudo/$password';
  } else {
    url = 'http://10.0.2.2:8082/accounts/view/by_pseudo/$pseudo/$password';
  }
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: "Connexion réussie");
    return Account.fromJson(jsonDecode(response.body));
  } else {
    Fluttertoast.showToast(msg: "Erreur de connexion");
    throw Exception('Failed to connect');
  }
}

// créer un nouvel utilisateur
Future<Account> createUser(String lastName, String firstName, String email,
    String pseudo, String password, String birthday) async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8082/accounts/add';
  } else {
    url = 'http://10.0.2.2:8082/accounts/add';
  }
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'userLastName': lastName,
      'userFirstName': firstName,
      'userEmail': email,
      'userPseudo': pseudo,
      'userPassword': password,
      'userBirthday': birthday
    }),
  );

  if (response.statusCode == 201) {
    Fluttertoast.showToast(msg: "Account created successfully!");
    return Account.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

Future<Post> createPost(String postTitle, String? postContent,
    String? postSource, int postIdUser, int postIdCom) async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8083/posts/add';
  } else {
    url = 'http://10.0.2.2:8083/posts/add';
  }
  final response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "postTitle": postTitle,
      "postContent": postContent,
      "postSource": postSource,
      "postDate": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "postIdUser": postIdUser,
      "postIdCom": postIdCom
    }),
  );

  if (response.statusCode == 201) {
    Fluttertoast.showToast(msg: "Post created successfully!");
    return Post.fromJson(jsonDecode(response.body));
  } else {
    log(response.body);
    throw Exception('Failed to create post.');
  }
}

Future<List<Post>> getAllPost() async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8083/posts/view/all';
  } else {
    url = 'http://10.0.2.2:8083/posts/view/all';
  }
  Response res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<Post> posts = body
        .map(
          (dynamic item) => Post.fromJson(item),
        )
        .toList();
    for (var post in posts) {
      await Future.wait([
        getUsernameById(post.postIdUser).then((value) => post.username = value)
      ]);
    }
    return posts;
  } else {
    throw "Unable to retrieve posts";
  }
}

Future<Post> updatePost(
    int postId,
    String postTitle,
    String? postContent,
    String? postSource,
    String postDate,
    int postUpvote,
    int postDownVote,
    int postIdUser,
    int postIdCom) async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8083/posts/edit/$postId';
  } else {
    url = 'http://10.0.2.2:8083/posts/edit/$postId';
  }
  final response = await http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      "postTitle": postTitle,
      "postContent": postContent,
      "postSource": postSource,
      "postDate": postDate,
      "postUpvote": postUpvote,
      "postDownvote": postDownVote,
      "postIdUser": postIdUser,
      "postIdCom": postIdCom
    }),
  );

  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to update post.');
  }
}

Future<Post> deletePost(int postId) async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8083/posts/delete/$postId';
  } else {
    url = 'http://10.0.2.2:8083/posts/delete/$postId';
  }
  final http.Response response = await http.delete(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    Fluttertoast.showToast(msg: "Post deleted successfully!");
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete post.');
  }
}

Future<List<Community>> getAllCommunities(BuildContext context) async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8081/communities/view/all';
  } else {
    url = 'http://10.0.2.2:8081/communities/view/all';
  }
  Response res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);

    List<Community> communities = body
        .map(
          (dynamic item) => Community.fromJson(item),
        )
        .toList();

    return communities;
  } else {
    throw "Unable to retrieve communities";
  }
}

Future<Community> getCommunityById(int id) async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8081/communities/view/$id';
  } else {
    url = 'http://10.0.2.2:8081/communities/view/$id';
  }
  Response res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    return Community.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to find community');
  }
}

String getCommunityNameById(int id) {
  Community community = getCommunityById(id) as Community;
  return community.communityName;
}

Future<Account> getAccountById(int id) async {
  String url;
  if (iOS) {
    url = 'http://127.0.0.1:8082/accounts/view/$id';
  } else {
    url = 'http://10.0.2.2:8082/accounts/view/$id';
  }
  Response res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    return Account.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to find account');
  }
}

Future<String> getUsernameById(dynamic id) async {
  Account account = await getAccountById(id);
  return account.userPseudo;
}
