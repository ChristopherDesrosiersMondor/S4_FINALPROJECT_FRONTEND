import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/AddPost.dart';
import 'package:interface_mobile/Pages/Chat.dart';
import 'package:interface_mobile/Pages/Discover.dart';
import 'package:interface_mobile/Pages/Home.dart';
import 'package:interface_mobile/Pages/Inbox.dart';
import 'package:interface_mobile/Pages/connexion.dart';
import 'package:interface_mobile/config.dart';

// Source: https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? keyApp}) : super(key: keyApp);

  static const String _title = 'MVP Hublot';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: HublotWidget(),
    );
  }
}

class HublotWidget extends StatefulWidget {
  HublotWidget({Key? keyHublot, this.userConnectId}) : super(key: keyHublot);
  int? userConnectId;

  @override
  State<HublotWidget> createState() => HublotWidgetState();
}

class HublotWidgetState extends State<HublotWidget> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Home(
        connectUserOnApp: connectUserOnApp,
      ),
      const DiscoverPage(),
      AddPostPage(
        connectUserOnApp: connectUserOnApp,
      ),
      ChatPage(
        connectUserOnApp: connectUserOnApp,
      ),
      InboxPage(
        connectUserOnApp: connectUserOnApp,
      )
    ];
  }

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
        backgroundColor: Configuration.appDarkBackgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              backgroundColor: Configuration.appDarkBackgroundColor,
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              backgroundColor: Configuration.appDarkBackgroundColor,
              icon: Icon(
                Icons.explore,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              backgroundColor: Configuration.appDarkBackgroundColor,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              backgroundColor: Configuration.appDarkBackgroundColor,
              icon: Icon(
                Icons.chat,
                color: Colors.white,
              ),
              label: ""),
          BottomNavigationBarItem(
              backgroundColor: Configuration.appDarkBackgroundColor,
              icon: Icon(
                Icons.notification_add,
                color: Colors.white,
              ),
              label: ""),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Configuration.orangeColor,
        onTap: _onItemTapped,
      ),
    );
  }

  void connectUserOnApp(int id) {
    setState(() {
      widget.userConnectId = id;
    });
    Home.of(context).updateUserConnectId(id);
    ChatPage.of(context).updateUserConnectId(id);
  }
}
