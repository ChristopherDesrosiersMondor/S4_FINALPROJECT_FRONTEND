import 'dart:html';

import 'package:flutter/material.dart';
import 'package:interface_mobile/utilities.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
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
          Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  'Log in to Hublot',
                  style: GoogleFonts.signika(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: .5,
                          fontSize: 25)),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              controller: pseudoController,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white60),
                hintText: "Username",
                filled: true,
                fillColor: Colors.grey.shade700,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
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
            padding: const EdgeInsets.all(8),
            child: TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: passwordController,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white60),
                hintText: "Password",
                filled: true,
                fillColor: Colors.grey.shade700,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50)),
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
            padding: const EdgeInsets.all(8),
            child: Text(
              'Forgot password',
              style: GoogleFonts.signika(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      letterSpacing: .5,
                      fontSize: 16)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                minimumSize: Size(MediaQuery.of(context).size.width, 36),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  var pseudo = pseudoController.text;
                  var password = passwordController.text;
                  userConnect(context, pseudo, password);
                }
              },
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
