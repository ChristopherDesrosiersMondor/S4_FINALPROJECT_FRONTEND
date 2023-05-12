import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/connexion.dart';
import 'package:interface_mobile/Pages/creationcompte.dart';
import 'package:interface_mobile/Pages/home.dart';

// Source: https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'MVP Hublot';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: HublotWidget(),
    );
  }
}

class HublotWidget extends StatefulWidget {
  const HublotWidget({super.key});

  @override
  State<HublotWidget> createState() => _HublotWidgetState();
}

class _HublotWidgetState extends State<HublotWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    ConnexionPage(),
    CreationCompte(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.anchor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Connexion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Création de compte',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
