import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/cta_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _mode = ThemeMode.system;
  var conteur = 0;

  // Fonction appelée lorsqu'on change le toggle
  void changeTheme(bool isDark) {
    setState(() {
      //on execute les themes predefinie sur app_theme.dart dependant de la valeur de isDark
      _mode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COFFE-Najma',

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _mode,

      home: MyHomePage(onThemeChanged: changeTheme),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final Function(bool) onThemeChanged;

  const MyHomePage({super.key, required this.onThemeChanged});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDark = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("COFFE SHOP"),

        ////mon toggle
        actions: [
          Icon(
            //const Icon (Icons.light_mode)
            isDark ? Icons.dark_mode : Icons.light_mode,
          ),
          Switch(
            ///le theme est capte au niveau de isDark
            value: isDark,
            //on click la valueur change
            onChanged: (value) {
              setState(() {
                //isDark recoit la nouvelle valeur:soit true,soit false
                isDark = value;
              });
              widget.onThemeChanged(value);
            },
          ),
        ],
        ////bouton recherche
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Theme changer ",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 50),
            Container(
              width: 300.0,
              margin: EdgeInsets.only(left: 600.0),
              child: TextField(
                //:pour preparer la saisie
                keyboardType: TextInputType.text,
                // obscureText: true,: pour cacher instatenement le texte saisieRR
                //pour limiter
                maxLength: 20,
                controller: _controller, // Associe le controller à ce TextField
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 10.0,
                  ),
                  //labelText: 'Entrez votre texte',
                  hintText: 'Rechercher un café...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ), // Coins arrondis
                  ),
                ),
              ),
            ),
            const SizedBox(height: 280),
            CtaButton(),
          ],
        ),
      ),
    );
  }
}
