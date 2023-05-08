import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Sources:
// How to use alert dialogs
// https://www.javatpoint.com/flutter-alert-dialogs

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConnexionPage'),
      ),
      body: const Center(child: ConnexionForm()),
    );
  }
}

class ConnexionForm extends StatefulWidget {
  const ConnexionForm({super.key});

  @override
  State<ConnexionForm> createState() => ConnexionFormState();
}

class ConnexionFormState extends State<ConnexionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController pseudoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pseudoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: pseudoController,
            decoration: const InputDecoration(
              hintText: 'Pseudo',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
              hintText: 'Mot de passe',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  connect();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  void connect() async {
    var pseudo = pseudoController.text;
    var password = passwordController.text;

    final response = await http.get(Uri.parse(
        'http://10.0.2.2:8082/accounts/view/by_pseudo/$pseudo/$password'));

    if (response.statusCode == 200) {
      showAlertDialog(true);
    } else {
      showAlertDialog(false);
    }
  }

  // showAlertDialog(String status) {
  //   // Create button
  //   Widget okButton = ElevatedButton(
  //     child: const Text("OK"),
  //     onPressed: () {
  //       Navigator.of(context).pop();
  //     },
  //   );

  //   // Create AlertDialog
  //   AlertDialog alert;
  //   alert = AlertDialog(
  //     title: Text(status),
  //     content: const Text("Success"),
  //     actions: [
  //       okButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

  showAlertDialog(bool connection) {
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
}
