import 'package:flutter/material.dart';
import 'theme/app_theme.dart';

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

  // Fonction appelée lorsqu'on change le toggle
  void changeTheme(bool isDark) {
    setState(() {
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
            value: isDark,
            onChanged: (value) {
              setState(() {
                isDark = value;
              });

              widget.onThemeChanged(value);
            },
          ),
        ],
      ),

      body: Center(
        child: Text(
          "Theme changer ",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
