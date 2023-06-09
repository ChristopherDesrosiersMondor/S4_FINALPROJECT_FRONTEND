import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interface_mobile/config.dart';
import 'package:interface_mobile/Pages/creationcompteNext.dart';

import 'Connexion.dart';

class CreationCompte extends StatelessWidget {
  const CreationCompte({Key? keyCreateCompte, this.connectUserOnApp})
      : super(key: keyCreateCompte);
  final void Function(int id)? connectUserOnApp;

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
                            builder: (context) => ConnexionPage(
                                  connectUserOnApp: connectUserOnApp,
                                )),
                      );
                    }),
            ])),
          )
        ],
        backgroundColor: Configuration.appDarkBackgroundColor,
      ),
      body: SingleChildScrollView(
          child: CreationCompteForm(
        connectUserOnApp: connectUserOnApp,
      )),
    );
  }
}

class CreationCompteForm extends StatefulWidget {
  const CreationCompteForm({super.key, this.connectUserOnApp});
  final void Function(int id)? connectUserOnApp;

  @override
  State<CreationCompteForm> createState() => CreationCompteFormState();
}

class CreationCompteFormState extends State<CreationCompteForm> {
  final GlobalKey<FormState> _formKeyAddUser = GlobalKey<FormState>();
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
      key: _formKeyAddUser,
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
          Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Center(
                child: ElevatedButton(
                  style: Configuration.formButtonStyle(context),
                  onPressed: () {
                    if (_formKeyAddUser.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreationCompteNext(
                                username: pseudoController.text,
                                password: passwordController.text,
                                connectUserOnApp: widget.connectUserOnApp)),
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
