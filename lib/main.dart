import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/cta_section.dart';
import 'widgets/hero_section.dart';
import 'widgets/features_sections.dart';
import 'widgets/footer.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

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
      /// enlever le debug en haut
      debugShowCheckedModeBanner: false,
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
        title: const Text("Najma "),

        //////actions[ensemble des widget qui s'affiche a droite dans appbar
        actions: [
          Container(
            width: 200,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Rechercher...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 4),
                ),

                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Icon(isDark ? Icons.dark_mode : Icons.light_mode),
          Switch(
            ///le theme est capte au niveau de isDark
            value: isDark,

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

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeroSection(),
            const SizedBox(height: 10),
            FeaturesSection(),
            const SizedBox(height: 35),
            //const Footer(),
            Center(child: CtaButton()),
            const SizedBox(height: 8),
            FooterSection(),

            //SocialButton.linkedinButton(onTap: () {}),
          ],
        ),
      ),

      // bottomNavigationBar: Container(
      //   height: 50,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       IconButton(
      //         icon: Icon(FontAwesomeIcons.facebook),
      //         onPressed: () {}, // <-- juste vide pour éviter l’erreur
      //       ),
      //       IconButton(icon: Icon(FontAwesomeIcons.twitter), onPressed: () {}),
      //       IconButton(
      //         icon: Icon(FontAwesomeIcons.instagram),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: Icon(FontAwesomeIcons.pinterest),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
