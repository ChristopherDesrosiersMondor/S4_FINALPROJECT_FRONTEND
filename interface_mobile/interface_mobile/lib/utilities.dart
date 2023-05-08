import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Sources:
// How to use alert dialogs
// https://www.javatpoint.com/flutter-alert-dialogs

showAlertDialogBool(BuildContext context, bool connection) {
  // Create button
  Widget okButton = ElevatedButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert;
  if (connection) {
    alert = AlertDialog(
      title: const Text("Connection True"),
      content: const Text("Success"),
      actions: [
        okButton,
      ],
    );
  } else {
    alert = AlertDialog(
      title: const Text("Connection False"),
      content: const Text("Error"),
      actions: [
        okButton,
      ],
    );
  }

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogText(BuildContext context, String text) {
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
    title: Text(text),
    content: const Text("Success"),
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

void userConnect(BuildContext context, String pseudo, String password) async {
  final response = await http.get(Uri.parse(
      'http://10.0.2.2:8082/accounts/view/by_pseudo/$pseudo/$password'));

  if (response.statusCode == 200) {
    showAlertDialogBool(context, true);
  } else {
    showAlertDialogBool(context, false);
  }
}
