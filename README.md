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
    ```flutter
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
    ```flutter
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
5. Api calls