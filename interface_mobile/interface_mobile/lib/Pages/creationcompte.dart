import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interface_mobile/config.dart';
import 'package:interface_mobile/Pages/creationcompteNext.dart';

import 'connexion.dart';

class CreationCompte extends StatelessWidget {
  const CreationCompte({super.key});

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
                  style: Configuration.textForApp(Colors.white, 16),
                  text: "Log in",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ConnexionPage()),
                      );
                    }),
            ])),
          )
        ],
        backgroundColor: Configuration.appDarkBackgroundColor,
      ),
      body: const SingleChildScrollView(child: CreationCompteForm()),
    );
  }
}

class CreationCompteForm extends StatefulWidget {
  const CreationCompteForm({super.key});

  @override
  State<CreationCompteForm> createState() => CreationCompteFormState();
}

class CreationCompteFormState extends State<CreationCompteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController pseudoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
                child: Text('Hi new friend, welcome to Hublot',
                    style: Configuration.textForApp(Colors.white, 22)),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child:
                Configuration.inputField(context, pseudoController, "Username"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Configuration.passwordInput(
                context, passwordController, "Password"),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreationCompteNext(
                                username: pseudoController.text,
                                password: passwordController.text)),
                      );
                    }
                  },
                  child: const Text('Next'),
                ),
              )),
        ],
      ),
    );
  }
}
