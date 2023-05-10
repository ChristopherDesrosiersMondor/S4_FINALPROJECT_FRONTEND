import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interface_mobile/config.dart';
import 'package:interface_mobile/creationcompte.dart';
import 'package:interface_mobile/utilities.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Configuration.appDarkBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {}),
        title: const Center(
          child: Icon(
            Icons.anchor,
            color: Configuration.orangeColor,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  style: Configuration.textForApp(Colors.white, 18),
                  text: "Sign up",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreationCompte()),
                      );
                    }),
            ])),
          )
        ],
        backgroundColor: Configuration.appDarkBackgroundColor,
      ),
      body: const SingleChildScrollView(child: ConnexionForm()),
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
                child: Text('Log in to Hublot',
                    style: Configuration.textForApp(Colors.white, 25)),
              )),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Configuration.inputField(
                  context, pseudoController, "Username")),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Configuration.passwordInput(
                context, passwordController, "Password"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              'Forgot password',
              style: Configuration.textForApp(Configuration.orangeColor, 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0),
            child: Center(
              child: ElevatedButton(
                style: Configuration.formButtonStyle(context),
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
          ),
        ],
      ),
    );
  }
}
