import 'package:flutter/material.dart';

class CreationCompte extends StatelessWidget {
  const CreationCompte({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Création compte'),
      ),
      body: const Center(child: Text('Page création de compte')),
    );
  }
}
