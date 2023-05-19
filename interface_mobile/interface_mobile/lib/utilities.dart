import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart' hide Key;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:interface_mobile/Entities/account.dart';
import 'package:interface_mobile/Entities/community.dart';
import 'package:interface_mobile/Widgets/postWidget.dart';

import 'Entities/post.dart';

// Sources:
// How to use alert dialogs
// https://www.javatpoint.com/flutter-alert-dialogs

// Http request with flutter
// https://docs.flutter.dev/cookbook/networking/send-data
// https://docs.flutter.dev/cookbook/networking/fetch-data
// https://www.geeksforgeeks.org/http-get-response-in-flutter/
// https://www.digitalocean.com/community/tutorials/flutter-flutter-http

// Hash text
// https://medium.flutterdevs.com/explore-encrypt-decrypt-data-in-flutter-576425347439

showAlertDialog(BuildContext context, String text) {
  // Create button
  Widget okButton = ElevatedButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert;
  alert = AlertDialog(
    title: const Text('Ohé!'),
    content: Text(text),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// connecter un utilisateur
Future<Account> userConnect(
    BuildContext context, String pseudo, String password) async {
  final response = await http.get(Uri.parse(
      'http://10.0.2.2:8082/accounts/view/by_pseudo/$pseudo/$password'));

  if (response.statusCode == 200) {
    showAlertDialog(context, "Connexion réussie");
    return Account.fromJson(jsonDecode(response.body));
  } else {
    showAlertDialog(context, "Erreur de connexion");
    throw Exception('Failed to connect');
  }
}

// créer un nouvel utilisateur
Future<Account> createUser(
    BuildContext context,
    String lastName,
    String firstName,
    String email,
    String pseudo,
    String password,
    String birthday) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8082/accounts/add'),
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
    showAlertDialog(context, "Compte créé avec succès");
    return Account.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

Future<List<Post>> getAllPost(BuildContext context) async {
  String url = 'http://10.0.2.2:8083/posts/view/all';
  Response res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);
    List<Post> posts = body
        .map(
          (dynamic item) => Post.fromJson(item),
        )
        .toList();
    return posts;
  } else {
    throw "Unable to retrieve posts";
  }
}

Future<List<Community>> getAllCommunities(BuildContext context) async {
  String url = 'http://10.0.2.2:8081/communities/view/all';
  Response res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    List<dynamic> body = jsonDecode(res.body);

    List<Community> communities = body
        .map(
          (dynamic item) => Community.fromJson(item),
        )
        .toList();

    showAlertDialog(context, communities.toString());
    return communities;
  } else {
    throw "Unable to retrieve communities";
  }
}

// Future<List<Community>> getAllCommunities() async {
//   String url = 'http://10.0.2.2:8081/communities/view/all';
//   final response = await http.get(Uri.parse(url));
//   var responseData = json.decode(response.body);

//   List<Community> listCommunities = [];

//   for (var com in responseData) {
//     Community community = Community(
//         id: com["id"],
//         communityName: com["communityName"],
//         communityDescription: com["communityDescription"],
//         // communityLogo: com["communityLogo"],
//         // communityHeaderImage: com["communityHeaderImage"],
//         communityCreatedOnDate: com["communityCreatedOnDate"],
//         // communityAmmountOfMembers: com["communityAmmountOfMembers"],
//         // communityAmmountOfPosts: com["communityAmmountOfPosts"],
//         communityCreatorId: com["communityCreatorId"]);

//     listCommunities.add(community);
//   }

//   return listCommunities;
// }

Future<Community> getCommunityById(int id) async {
  String url = 'http://10.0.2.2:8081/communities/view/$id';
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
  String url = 'http://10.0.2.2:8082/accounts/view/$id';
  Response res = await http.get(Uri.parse(url));

  if (res.statusCode == 200) {
    return Account.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Failed to find account');
  }
}

Future<String> getUsernameById(int id) async {
  Account account = await getAccountById(id);
  return account.userPseudo;
}
