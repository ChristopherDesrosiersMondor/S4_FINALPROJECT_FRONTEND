import 'package:flutter/material.dart';
import 'package:interface_mobile/utilities.dart';
import 'package:intl/intl.dart';

// Sources
// Datepicker in Flutter
// https://www.fluttercampus.com/guide/39/how-to-show-date-picker-on-textfield-tap-and-get-formatted-date/

class CreationCompte extends StatelessWidget {
  const CreationCompte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('CreationCompte'),
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
          TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: lastNameController,
            decoration: const InputDecoration(
                hintText: 'Nom', hintStyle: TextStyle(color: Colors.grey)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: firstNameController,
            decoration: const InputDecoration(
                hintText: 'Prénom', hintStyle: TextStyle(color: Colors.grey)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: emailController,
            decoration: const InputDecoration(
                hintText: 'Courriel', hintStyle: TextStyle(color: Colors.grey)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: pseudoController,
            decoration: const InputDecoration(
                hintText: 'Pseudo', hintStyle: TextStyle(color: Colors.grey)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(
                hintText: 'Mot de passe',
                hintStyle: TextStyle(color: Colors.grey)),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            style: const TextStyle(color: Colors.white),
            controller: birthdayController,
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: "Date de naissance",
                hintStyle: TextStyle(color: Colors.grey)),
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
                showAlertDialog(context, "Veuillez sélectionner une date.");
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
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
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
