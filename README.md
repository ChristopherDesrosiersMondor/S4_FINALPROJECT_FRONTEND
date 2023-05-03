# S4_FINALPROJECT_FRONTEND
 
## Pour avoir plusieurs projets dans le meme repo qui ont chacun leurs devcontainer
<https://code.visualstudio.com/remote/advancedcontainers/change-default-source-mount>

## Les taches pour examen pratique en mobile - MVP mobile app hublot
### Présentation examen
1. User stories - Dod du livrable
2. Description de ce qu'on va remettre pour la partie dans un markdown

### Flutter
1. Champs d'entrée - Form widget
    Source : [Form class](https://api.flutter.dev/flutter/widgets/Form-class.html)

    ```dart
    class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context) {
        return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            TextFormField(
                decoration: const InputDecoration(
                hintText: 'Enter your email',
                ),
                validator: (String? value) {
                if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                }
                return null;
                },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                    // Process data.
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
    ```
2. Bouton
    Voir la section 1
3. Texte
    Source : 

    ```dart
    class MyTextPage extends StatelessWidget {  
    @override  
    Widget build(BuildContext context) {  
        return Scaffold(  
        appBar: AppBar(  
            title:Text("Text Widget Example")  
        ),  
        body: Center(  
            child:Text("Welcome to Javatpoint")  
        ),  
        );  
    }  
    }  
    ```
4. Plusieurs pages
    Source: https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html

    ```dart
    import 'package:flutter/material.dart';

    void main() => runApp(const MyApp());

    class MyApp extends StatelessWidget {
    const MyApp({super.key});

    static const String _title = 'Flutter Code Sample';

    @override
    Widget build(BuildContext context) {
        return const MaterialApp(
        title: _title,
        home: MyStatefulWidget(),
        );
    }
    }

    class MyStatefulWidget extends StatefulWidget {
    const MyStatefulWidget({super.key});

    @override
    State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
    }

    class _MyStatefulWidgetState extends State<MyStatefulWidget> {
    int _selectedIndex = 0;
    static const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    static const List<Widget> _widgetOptions = <Widget>[
        Text(
        'Index 0: Home',
        style: optionStyle,
        ),
        Text(
        'Index 1: Business',
        style: optionStyle,
        ),
        Text(
        'Index 2: School',
        style: optionStyle,
        ),
    ];

    void _onItemTapped(int index) {
        setState(() {
        _selectedIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: const Text('BottomNavigationBar Sample'),
        ),
        body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
            ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
        ),
        );
    }
    }
    ```
5. Api calls
    Source: [Exemple de fetch data en flutter](https://docs.flutter.dev/cookbook/networking/fetch-data)

    ```dart
    import 'dart:async';
    import 'dart:convert';

    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;

    Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return Album.fromJson(jsonDecode(response.body));
    } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
    }
    }

    class Album {
    final int userId;
    final int id;
    final String title;

    const Album({
        required this.userId,
        required this.id,
        required this.title,
    });

    factory Album.fromJson(Map<String, dynamic> json) {
        return Album(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        );
    }
    }

    void main() => runApp(const MyApp());

    class MyApp extends StatefulWidget {
    const MyApp({super.key});

    @override
    State<MyApp> createState() => _MyAppState();
    }

    class _MyAppState extends State<MyApp> {
    late Future<Album> futureAlbum;

    @override
    void initState() {
        super.initState();
        futureAlbum = fetchAlbum();
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Fetch Data Example',
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
            title: const Text('Fetch Data Example'),
            ),
            body: Center(
            child: FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const CircularProgressIndicator();
                },
            ),
            ),
        ),
        );
    }
    }
    ```