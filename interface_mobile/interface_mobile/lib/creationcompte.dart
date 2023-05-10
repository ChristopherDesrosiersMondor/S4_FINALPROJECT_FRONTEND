import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:interface_mobile/config.dart';
import 'package:interface_mobile/utilities.dart';
import 'package:intl/intl.dart';

import 'connexion.dart';

// Sources
// Datepicker in Flutter
// https://www.fluttercampus.com/guide/39/how-to-show-date-picker-on-textfield-tap-and-get-formatted-date/

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
                  style: Configuration.textForApp(Colors.white, 18),
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
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pseudoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8),
            child: Configuration.inputField(
                context, lastNameController, "Last Name"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Configuration.inputField(
                context, firstNameController, "First Name"),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Configuration.inputField(context, emailController, "Email"),
          ),
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
            padding: const EdgeInsets.all(8),
            child: Container(
              alignment: Alignment.center,
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: birthdayController,
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Colors.grey.shade700,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade700,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20)),
                      hintText: "Birthday",
                      hintStyle: const TextStyle(color: Colors.grey)),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            1900), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime.now());

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        birthdayController.text =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {
                      showAlertDialog(
                          context, "Veuillez sélectionner une date.");
                    }
                  },
                ),
              ),
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
                      var lastName = lastNameController.text;
                      var firstName = firstNameController.text;
                      var email = emailController.text;
                      var pseudo = pseudoController.text;
                      var password = passwordController.text;
                      var birthday = birthdayController.text;
                      createUser(context, lastName, firstName, email, pseudo,
                          password, birthday);
                    }
                  },
                  child: const Text('Create Account'),
                ),
              )),
        ],
      ),
    );
  }
}
