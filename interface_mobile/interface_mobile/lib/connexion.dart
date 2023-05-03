import 'package:flutter/material.dart';

class ConnexionPage extends StatelessWidget {
  const ConnexionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion Page'),
      ),
      body: const Center(child: Text('Page de connexion')),
    );
  }
}
