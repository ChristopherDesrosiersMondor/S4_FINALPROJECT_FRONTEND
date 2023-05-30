import 'package:flutter/material.dart';
import 'package:interface_mobile/Pages/AddPost.dart';
import 'package:interface_mobile/Pages/Chat.dart';
import 'package:interface_mobile/Pages/Discover.dart';
import 'package:interface_mobile/Pages/Home.dart';
import 'package:interface_mobile/Pages/Inbox.dart';
import 'package:interface_mobile/config.dart';
import 'package:interface_mobile/utilities.dart';
import 'package:provider/provider.dart';

// Source: https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? keyApp}) : super(key: keyApp);

  static const String _title = 'MVP Hublot';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConnectUser>(
        create: (_) => ConnectUser(),
        child: Consumer<ConnectUser>(
          builder: (context, provider, child) => const MaterialApp(
            title: _title,
            home: HublotWidget(),
          ),
        ));
  }
}

class ConnectUser with ChangeNotifier {
  dynamic userId;
  dynamic username = "";

  void updateUserId(int id) {
    userId = id;
    if (userId != null) {
      getUsernameById(id).then((value) {
        username = value;
      });
    }
    notifyListeners();
  }
}

class HublotWidget extends StatefulWidget {
  const HublotWidget({Key? keyHublot}) : super(key: keyHublot);

  @override
  State<HublotWidget> createState() => HublotWidgetState();
}

class HublotWidgetState extends State<HublotWidget> {
  int _selectedIndex = 0;
  late List<Widget> _widgetOptions;
  dynamic userConnectId;

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
    // setState(() {
    //   userConnectId = id;
    // });
    var userProvider = context.read<ConnectUser>();
    userProvider.updateUserId(id);
  }

  getUserId() {
    if (userConnectId != null) {
      return userConnectId;
    }
    return null;
  }
}
